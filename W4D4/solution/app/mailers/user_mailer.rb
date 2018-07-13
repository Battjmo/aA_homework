class UserMailer < ApplicationMailer

default from: 'nhbattjes@gmail.com'

def welcome_email(user)
  @user = user
  @url = 'http://localhost:3000/cats'
  mail(to: user.username, subject: 'Welcome to 99 Cats!')
end
end
