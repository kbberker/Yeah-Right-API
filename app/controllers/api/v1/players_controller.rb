class Api::V1::PlayersController < ApplicationController

  def index
    @players = Player.all
    render json: @players 
  end
  
  def games_players
    @players = Player.where(game_id: params[:game_id])
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

  def set_dasher
    players = Player.where(game_id: params[:new_dasher][:game][:id])
    new_dasher = Player.find_by(id: params[:new_dasher][:id])
    if new_dasher
      new_dasher.update(is_dasher: true)
      non_dashers = players.select {|player| player.id != new_dasher.id}
      non_dashers.each {|player| player.update(is_dasher: false)}
      render json: {new_dasher: new_dasher, non_dashers: non_dashers}
    else
      render json: {error: "Unable to find player to set as dasher"}, status: 400
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
    # Doesn't work when .require is added first
    params.permit(:name, :is_dasher, :game_name, :player_id, :players => [])
  end

end
