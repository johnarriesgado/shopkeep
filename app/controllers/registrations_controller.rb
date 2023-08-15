class RegistrationsController < Devise::RegistrationsController
  layout 'login_layout'

  def new
    @user = User.new
    render 'devise/registrations/new'
  end

  def create
    @user = User.new(sign_up_params) # Use Devise's sign_up_params method to safely permit user parameters

    if @user.save
      # Handle successful registration, e.g., sending a welcome email, redirecting, etc.
      redirect_to authenticated_root_path
    else
      # Registration failed, show errors and render the registration form again
      render 'devise/registrations/new'
    end
  end

  private

  # Define permitted parameters for user sign-up
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
