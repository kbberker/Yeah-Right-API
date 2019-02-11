class Api::V1::GamesController < ApplicationController

  def index
    @games = Game.all
    render json: @games
  end

  def create
    game = Game.new(game_params)
    if game.save
      # render json: @game
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        GameSerializer.new(game)
      ).serializable_hash
      ActionCable.server.broadcast 'games_channel', serialized_data
      head :ok
    else 
      render json: {error: "Unable to create game"}, status: 400
    end
  end

  def show
    # TODO render full game object, not just the rounds, by adding serializer
    @game = Game.find_by(id: params[:id])
    if @game
      render json: @game.rounds
    else
      render json: {error: "Unable to find game"}, status: 400
    end
  end

  private

  def game_params
    params.require(:game).permit(:name, :pin)
  end

end
