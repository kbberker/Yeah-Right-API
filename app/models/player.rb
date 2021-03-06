class Player < ApplicationRecord
  belongs_to :game
  has_many :answers
  has_many :votes

  def game_name=(name)
    self.game = Game.find_or_create_by(name: name)
  end

  def game_name
    self.game ? self.game.name : nil
  end

end
 