class Api::V1::PlayersController < ApplicationController

  def index
    @players = Player.all
    render json: @players 
  end

  def show
    @player = Player.find_by(id: params[:id])
    render json: @player
  end

  def create
    @player = Player.new(play)
  end

  private

  def player_params
    params.require(:player).permit(:name, :is_dasher)
  end

end
