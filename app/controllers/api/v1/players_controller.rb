class Api::V1::PlayersController < ApplicationController

  def index
    @players = Player.all
    render json: @players 
  end

  def show
    @player = Player.find_by(id: params[:id])
    if @player
      render json: @player
    else
      render json: {error: "User not found"}, status: 400
    end
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      render json: @player
    else
      render json: {error: "Unable to create user"}, status: 400
    end
  end

  def destroy
    @player = Player.find_by(id: params[:id])
    if @player
      @player.destroy()
      render json: {message: "User successfully deleted"}
    else
      render json: {error: "User not found"}, status: 400
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :is_dasher)
  end

end
