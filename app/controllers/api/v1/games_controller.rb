class Api::V1::GamesController < ApplicationController

  def index
    @games = Game.all
    render json: @games
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      render json: @game
    else 
      render json: {error: "Unable to create game"}, status: 400
    end
  end

  def show
    @game = Game.find_by(id: params[:id])
  end

  private

  def game_params
    params.require(:game).permit(:name, :pin)
  end

end
