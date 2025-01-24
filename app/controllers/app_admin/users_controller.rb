class AppAdmin::UsersController < ApplicationController
  before_action :set_user, only: %i[edit update ]

  def index
    @users = User.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to app_admin_users_url, notice: "User Role succesfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(role_ids: [])
  end
end
