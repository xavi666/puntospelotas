class UserMailer < ApplicationMailer
  default from: "puntospelotas16@gmail.com"
 
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def game_email(user, game)
    @user = user
    @game = game
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Puntos Pelotas - Notificación de Puntos')
  end
end
