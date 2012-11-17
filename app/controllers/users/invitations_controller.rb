class Users::InvitationsController < Devise::InvitationsController

  private
  def resource_params
    if params[:user]
      if action_name == 'update'
        update_params
      else
        create_params
      end
    end
  end

  def create_params
    params.require(:user).permit(:email, :name, :role)
  end

  def update_params
    params.require(:user).permit(:name, :password, :password_confirmation, :invitation_token)
  end
end
