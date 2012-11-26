ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :user_name => ENV['mail_user_name'],
  :password => ENV['mail_password'],
  :authentication => 'plain',
  :enable_starttls_auto => true
}
