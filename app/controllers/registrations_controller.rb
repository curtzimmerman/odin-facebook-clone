class RegistrationsController < Devise::RegistrationsController

	def create
		super
		UserMailer.welcome_email(@user).deliver_later if resource.save
	end

	private

	def sign_up_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
		
end