class UserMailer < ApplicationMailer

  def activation_needed_email(user)
    @user = user
    @url  = "https://shift-scheduler-fyusuke.c9users.io/users/#{user.activation_token}/activate"
    mail(:to => user.email,
         :subject => "Welcome to My Awesome Site")
  end
   
  def activation_success_email(user)
    @user = user
    @url  = "https://shift-scheduler-fyusuke.c9users.io/login"
    mail(:to => user.email,
         :subject => "Your account is now activated")
  end
end
