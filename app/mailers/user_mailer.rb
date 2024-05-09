class UserMailer < ApplicationMailer
    default from: email_address_with_name('kevinwairi@gmail.com',
    'pos')

    def welcome_email(user)
        puts "OKKKKKKKKKKKKKKKKKKKKRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR #{user.email}"
        @user = user
        url  = 'http://localhost:4000'
        mail(to: email_address_with_name(@user.email,@user.firstname), subject: 'Welcome to My Awesome Site')
    end
end
