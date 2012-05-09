This is a quick application to get up and running in Ruby on Rails for anyone looking to collect user emails and gauge interest before launching. We ([@mikebabb](http://github.com/mikebabb) and I), needed an application that provided signup for two types of users. Nothing on the market was really available for this… so we built it. Please fork and enjoy. I'm sure that someone will find bugs. I'm even more sure that someone in the community will make it even more awesome. Cheers!

Features:
1.Email collection for two types of users
2.Social sharing 
3. Auto mailer

This is filled with our content. Wouldn't take you too long to change it to fit your needs, but just a heads up. 

.gitignore includes the mail initializer because it contains passwords/usernames etc. Here is the layout for stmp through google. Just fill with your own information:

ActionMailer::Base.smtp_settings = {
	:address			=> "smtp.gmail.com",
	:port					=> 587,
	:domain 			=> "mydomain",
	:user_name 		=> "myuser@mydomain.com",
	:password 		=> "mypassword",
	:authenticaton => "plain",
	:enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"

NOTE: App not styled. App not finished. 