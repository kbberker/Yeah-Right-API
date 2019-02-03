class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :game
  belongs_to :game
  class GameSerializer < ActiveModel::Serializer
    attributes :id, :name, :pin
  end
end
