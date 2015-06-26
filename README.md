[![BuildStatus](https://semaphoreci.com/api/v1/projects/a51d3df9-aef8-49a3-ab52-fa241c4b00f4/459208/badge.svg)](https://semaphoreci.com/kaiomagalhaes/launchpage-rails)
[![CodeClimate](https://codeclimate.com/github/kaiomagalhaes/launchpage-rails/badges/gpa.svg)](https://codeclimate.com/github/kaiomagalhaes/launchpage-rails)
[![TestCoverage](https://codeclimate.com/github/kaiomagalhaes/launchpage-rails/badges/coverage.svg)](https://codeclimate.com/github/kaiomagalhaes/launchpage-rails/coverage)

This is a quick application to get up and running quickly with your new
startup idea so you can focus on your actual product. It is a prelaunch
MVP landing page aimed at gathering signups and testing market interest.
It was originally written as an open source alternative to LaunchRock.
It is written with Ruby on Rails. Originally, we needed an application
that provided signup for two types of users for a two-sided market. It's
out of the box, ready to go.  Just add styling. Fork and enjoy! 

*It may have a bit of our content, but it wouldn't take you too long to
change it to fit your need. Just a heads up.*

###Example 

Here is an example of the launchpage once it's all styled/designed
(although, both the project and design are old):
[Backstagr](http://www.backsta.gr)

###Features

1. Email collection for two types of users

2. Social sharing

3. Auto mailer

4. Ability to export user emails via CSV

  **Coming soon**

5. Post signup survey and questionaire to gather more market research
   from your beta users.

6. Waiting list social actions (i.e. move up the list if you share to 3
   friends or something along these lines)

###Get it running
Items you should change to customise it for your needs (baring the
obvious. I'm not listing those. You'll see the title, etc.):

1. The .gitignore includes the mail initializer.

2. Create the file *setup_email.rb* in */config/initializers* with the layout 
for stmp below and fill with your own information: 

```ruby
require 'development_mail_interceptor'

ActionMailer::Base.smtp_settings = {
:address=> "smtp.gmail.com",
:port=> 587,
:designedomain => "mydomain",
:user_name => "myuser@mydomain.com",
:password => "mypassword",
:authenticaton => "plain",
:enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if
Rails.env.development?
```

  - Change the email in lib/development_mail_interceptor.rb to your
    email so that when you're running app in development the test emails
get sent to your email address.

2. You'll want to go into `app/views/static/success` as well as
   `app/views/layouts/_twitterscript`/`app/views/layouts/_facebookscript`
and change the details of the social plugins to match your
domain/twitter/facebook. It's easy to add HN, Reddit, etc.

3. All the normal rails stuff to start up an app. I'm only calling out
   the items that need to be changed that aren't so obvious.


###Contributing

1. Fork the repo and clone it.

2. Make your changes in a new git branch:

   `git checkout -b my-fix-branch master`

3. Create your patch, including appropriate test cases making sure they
   pass.

4. Push your branch to GitHub:

   `git push origin my-fix-branch`

5. In GitHub, send a pull request to `launchpage-rails:master`


###Contributors
A really big thanks to [kaiomagalhaes](https://github.com/kaiomagalhaes)
for updating this to Rails 4 and improving some very old code.

- [codelitt](https://github.com/codelitt)
- [mikebabb](https://github.com/mikebabb)
- [kaiomagalhaes](https://github.com/kaiomagalhaes)

