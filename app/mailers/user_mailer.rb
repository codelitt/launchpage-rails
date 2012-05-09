class UserMailer < ActionMailer::Base
	default :from => "info@backsta.gr"
	
	def registration_confirmation(user)
		mail(:to => user.email, :subject => "Registered with Backstagr!")
	end
end
