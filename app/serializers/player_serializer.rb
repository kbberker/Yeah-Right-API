class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :is_dasher, :game
  belongs_to :game
  # class GameSerializer < ActiveModel::Serializer
  #   attributes :id, :name, :pin
  # end
end
