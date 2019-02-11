class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :text
  belongs_to :player
  belongs_to :round
end
