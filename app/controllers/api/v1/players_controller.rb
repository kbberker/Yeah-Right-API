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
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        GameSerializer.new(@player.game)
      ).serializable_hash
      ActionCable.server.broadcast 'games_channel', serialized_data
      head :ok
    else
      render json: {error: "Unable to create user"}, status: 400
    end
  end

  def set_dasher
    players = params[:players]
    dasher = Player.find_by(id: params[:player_id])
    # dasher.update

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
    # :game_name is a customer getter/setter method defined in player model
    params.permit(:name, :is_dasher, :game_name, :player_id, :players => [])
  end

end
