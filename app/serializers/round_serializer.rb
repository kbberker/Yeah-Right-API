class RoundSerializer < ActiveModel::Serializer
  attributes :id, :round_num, :game_id, :answers, :players
  has_many :answers
  has_many :players, through: :game
  class AnswerSerializer < ActiveModel::Serializer
    attributes :id, :player_id, :round_id, :text
  end
  class PlayerSerializer < ActiveModel::Serializer
    attributes :id, :name, :is_dasher
  end
end
