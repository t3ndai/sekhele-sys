class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  include Pundit::Authorization

  inertia_share do
    {
      employee: current_employee&.as_json(only: %i[id work_email]).merge(
        is_manager: current_employee&.is_manager?,
        # is_admin: current_employee&.is_admin?,
        # is_super_admin: current_employee&.is_super_admin?,
        full_name: current_employee&.full_name,
      ),
      org_id: current_employee.organization.id
    } if current_employee
  end

  before_action :set_current_request_details
  before_action :authenticate
  before_action :pundit_user
  before_action :current_employee

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
    def authenticate
      if session_record = Session.find_by_id(cookies.signed[:session_token])
        Current.session = session_record
      else
        redirect_to sign_in_path
      end
    end

    def set_current_request_details
      Current.user_agent = request.user_agent
      Current.ip_address = request.ip
    end

    def require_sudo
      unless Current.session.sudo?
        redirect_to new_sessions_sudo_path(proceed_to_url: request.original_url)
      end
    end

    def pundit_user
      @current_user = Current.user
    end

    def current_employee
      @current_employee ||= Current.user&.employee
    end

    def user_not_authorized
      flash[:alert] = "You are not allowed to perform this action"
      redirect_back_or_to(root_path)
    end
end
