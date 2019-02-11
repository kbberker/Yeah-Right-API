class PlayersChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    game = Game.find_by(id: params[:game_id])
    stream_for game
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
