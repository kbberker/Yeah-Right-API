class RoundSerializer < ActiveModel::Serializer
  attributes :id, :round_num, :game_id, :answers
  has_many :answers
  class AnswerSerializer < ActiveModel::Serializer
    attributes :id, :player_id, :round_id, :text
  end
end
