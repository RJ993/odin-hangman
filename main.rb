require_relative 'lib/game-mechanics'
require_relative 'lib/game-elements/secret_word'
require_relative 'lib/game-elements/player'

image = Image.new
word_storage = SecretWord.new
word_storage.generate_word
puts "What is your name, Player?"
player = Player.new(gets.chomp)
game = Game.new(word_storage.word, player, player.name, image)
game.play