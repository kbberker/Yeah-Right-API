class Round < ApplicationRecord
  belongs_to :game
  has_many :answers
  has_many :players, through: :game

  # Currently not used, could delete.
  
  # def round_num=(number)

  #   self.game = Game.find_or_create_by(name: name)
  # end

  # def round_num
  #   self.game ? self.game.name : nil
  # end


end
