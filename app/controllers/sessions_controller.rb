class SessionsController < ApplicationController
  skip_before_action :authenticate, only: %i[ new create ]

  before_action :set_session, only: :destroy

  inertia_share do
    {
      employee: @current_employee&.as_json(only: %i[id work_email]).merge(
        is_manager: @current_employee&.is_manager?,
        # is_admin: @current_employee&.is_admin?,
        # is_super_admin: @current_employee&.is_super_admin?,
        full_name: @current_employee&.full_name,
      ),
      org_id: @current_employee.organization.id
    } if @current_employee
  end


  def index
    @sessions = Current.user.sessions.order(created_at: :desc)
  end

  def new
  end

  def create
    if user = User.authenticate_by(email: params[:email], password: params[:password])
      if user.otp_required_for_sign_in?
        session[:challenge_token] = user.signed_id(purpose: :authentication_challenge, expires_in: 20.minutes)
        redirect_to new_two_factor_authentication_challenge_totp_path
      else
        @session = user.sessions.create!
        cookies.signed.permanent[:session_token] = { value: @session.id, httponly: true }

        @current_employee ||= user&.employee

        if @current_employee
          redirect_to employee_home_path(@current_employee), notice: "Signed in successfully"
        else
          redirect_to root_path, notice: "Signed in successfully"
        end
      end
    else
      redirect_to sign_in_path(email_hint: params[:email]), alert: "That email or password is incorrect"
    end
  end

  def destroy
    @session.destroy; redirect_to(sessions_path, notice: "That session has been logged out")
  end

  private
    def set_session
      @session = Current.user.sessions.find(params[:id])
    end
end
