class Api::V1::RoundsController < ApplicationController

  def create
    @round = Round.new(game_id: 1, round_num: 1)
    if @round.save
      render json: @round
    else
      render json: {error: "Unable to create round"}, status: 400
    end
  end

end
