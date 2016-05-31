class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  private
    def game_params
      params.require(:game).permit([:name])
    end
end