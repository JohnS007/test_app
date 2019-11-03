class UserMailer < ApplicationMailer

   def registration_confirmation(zuser)
      @zuser = zuser
      mail(:to => @zuser.email, :subject => "Registration Confirmation")
   end
end
