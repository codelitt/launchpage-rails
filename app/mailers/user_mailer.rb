class UserMailer < ActionMailer::Base
	default :from => ENV["FROM_EMAIL"]

	def registration_confirmation(user)
		mail(:to => user.email, :subject => ENV["MAIL_SUBJECT"])
	end
end
