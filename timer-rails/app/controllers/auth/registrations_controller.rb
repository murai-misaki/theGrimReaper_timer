class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController

  private

  def sign_up_params
    params.permit(:name, :email, :password, :password_confirmation, :guest)
  end

  def account_update_params
    params.permit(:name, :email, :password, :password_confirmation, :guest, :privacy)
  end
end