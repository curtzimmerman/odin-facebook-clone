class UserMailer < ApplicationMailer
	default from: "notifications@odinfacebook.com"

	def welcome_email(user)
		@user = user
		if Rails.env.production?
			@url = "http://aqueous-ravine-6303.herokuapp.com/users/sign_in"
		else
			@url = "http://localhost:3000/users/sign_in"
		end
		mail(to: @user.email, subject: "Welcome to Odin Facebook Clone")
	end

end
