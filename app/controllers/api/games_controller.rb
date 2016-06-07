class Api::GamesController < ApplicationController
  before_action :authenticate_user!, :except => [:create]

  def index
    @games = Game.all
  end

end