class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :pin, :players
  has_many :players
  has_many :rounds
end
