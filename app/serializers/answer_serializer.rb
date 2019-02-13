class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :text, :round_id, :player_id, :player
  belongs_to :player
end
