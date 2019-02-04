class Api::V1::RoundsController < ApplicationController

  def create
    @round = Round.new(game_id: params[:game_id], round_num: 1)
    if @round.save
      render json: @round
    else
      render json: {error: "Unable to create round"}, status: 400
    end
  end

  private

  def player_params
    # Doesn't work when .require is added first
    params.permit(:game_id, :round_num)
  end

end
