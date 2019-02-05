class Api::V1::AnswersController < ApplicationController

  def create
    @answer = Answer.new(text: params[:text], round_id: params[:round_id], player_id: params[:player_id])
    if @answer.save
      render json: @answer
    else
      render json: {error: "Unable to create answer"}, status: 400
    end
  end

  private

end
