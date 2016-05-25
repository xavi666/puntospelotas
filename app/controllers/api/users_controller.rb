class Api::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def update
    @user.assign_attributes(@json['user'])
    @user.save
  end

end
