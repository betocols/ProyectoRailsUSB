class UserMailer < ActionMailer::Base
  default from: "notification@d-answer.com"
  
  def welcome_email(user)
    @user = user
    @url  = "localhost:3000"
    mail(:to => user.email, :subject => "Welcome to D-Answer")
  end
end
