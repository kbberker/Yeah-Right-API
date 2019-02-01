class Round < ApplicationRecord
  belongs_to :game
  has_many :answers
  has_many :players, through: :game
end
