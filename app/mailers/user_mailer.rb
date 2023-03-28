class UserMailer < ActionMailer::Base
    default :from => "retrievr@retrievrapp.com"

   def registration_confirmation(user)
      @user = user
      mail(:to => "#{user.name} <#{user.email}>", :subject => "Registration Confirmation")
   end

   def send_reset_password_token(user, token)
      @user = user
      @token = token
      mail(:to => "#{user.name} <#{user.email}>", :subject => "Password Reset Code")
   end
end