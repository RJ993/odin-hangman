require_relative 'game-elements/secret_word'
require_relative 'game-elements/player'

class Game
attr_reader :answer

  def initialize(word_storage, player)
    @answer = word_storage
    @player = player
  end
end