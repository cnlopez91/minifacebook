class MinifacebookMailer < ApplicationMailer
    def added_friend(user)
        @user = user
        mail(from: 'support@minifacebook.com', to: user.email, subject: 'New Friend Added!')
    end
end
