class Api::V1::RoundsController < ApplicationController

  def create
    game = Game.find_by(id: params[:game_id])
    if game.rounds.first === nil
      @round = Round.new(game_id: game.id, round_num: 1)
      if @round.save
        render json: @round
      else
        render json: {error: "Unable to create round"}, status: 400
      end
    else
      new_round_num = game.rounds.last.round_num + 1
      @round = Round.new(game_id: params[:game_id], round_num: new_round_num)
      if @round.save
        render json: @round
      else
        render json: {error: "Unable to create round"}, status: 400
      end
    end    
  end

  def show
    @round = Round.find_by(id: params[:id])
    if @round
      render json: @round
    else
      render json: {error: "Round not found"}, status: 400
    end
  end

  private

  def round_params
    # Doesn't work when .require is added first
    params.permit(:game_id, :round_num)
  end

end
