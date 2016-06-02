class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  after_create :send_email

  def send_email
    UserMailer.welcome_email(self).deliver
  end

end
