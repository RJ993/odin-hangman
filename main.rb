require_relative 'lib/game-mechanics'
require_relative 'lib/game-elements/secret_word'
require_relative 'lib/game-elements/player'

option = ''
puts 'Hello, Player, welcome to Hangman!!! Please type "new" for new game or "load" to load a previous save.'
until option == 'new' || option == 'load'
  option = gets.chomp.downcase
end
if option == 'new'
  image = Image.new
  word_storage = SecretWord.new
  word_storage.generate_word
  puts "I believe I didn't get your name. What is it?"
  player = Player.new(gets.chomp)
  game = Game.new(word_storage.word, player, player.name, image)
  game.play
end
if option == 'load'
  puts 'Sorry, but save states are a work in progress!!!'
end