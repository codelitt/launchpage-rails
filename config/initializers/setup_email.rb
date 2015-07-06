require 'development_mail_interceptor'

ActionMailer::Base.smtp_settings = {
 :address              => ENV["SMTP_ADDRESS"],
 :port                 => ENV["SMPT_PORT"],
 :domain               => ENV["DOMAIN"],
 :user_name            => ENV["SMTP_USERNAME"],
 :password             => ENV["SMTP_PASSWORD"],
 :authenticaton        => "plain",
 :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if
Rails.env.development?
