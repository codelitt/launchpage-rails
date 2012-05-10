<b>NOTE: App not styled</b><br />
This is a quick application to get up and running in Ruby on Rails for anyone looking to collect user emails and gauge interest before launching. We ([@mikebabb](http://github.com/mikebabb) and I), needed an application that provided signup for two types of users. Nothing on the market was really available for this… so we built it. Please fork and enjoy. I'm sure that someone will find bugs. I'm even more sure that someone in the community will make it even more awesome. This is filled with our content, but it wouldn't take you too long to change it to fit your need. Just a heads up. 
Cheers!

Features: <br />
1.Email collection for two types of users <br />
2.Social sharing <br />
3. Auto mailer <br />

Items you should change to customise it for your needs (baring the obvious. I'm not listing those. You'll see the title, etc.):

1. The .gitignore includes the mail initializer because it contains passwords/usernames etc. Here is the layout for stmp through google. Just fill with your own information:

<pre><code>ActionMailer::Base.smtp_settings = {
	:address			=> "smtp.gmail.com",
	:port					=> 587,
	:domain 			=> "mydomain",
	:user_name 		=> "myuser@mydomain.com",
	:password 		=> "mypassword",
	:authenticaton => "plain",
	:enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"</code></pre>

2. You'll want to go into app/views/static/success and change the details of the social plugins to match your domain/twitter/facebook.  