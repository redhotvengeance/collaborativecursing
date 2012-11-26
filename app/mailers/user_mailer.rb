class UserMailer < ActionMailer::Base
  default from: "rhv@collaborativecursing.com"

  def verification_email(user)
    @user = user
    
    mail(:to => user.email, :subject => 'Welcome to Collaborative Cursing!')
  end
end
