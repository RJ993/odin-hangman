require_relative 'lib/game-mechanics'
require_relative 'lib/game-elements/secret_word'
require_relative 'lib/game-elements/player'
require 'yaml'

option = ''
puts 'Hello, Player, welcome to Hangman!!! Please type "new" for new game or "load" to load a previous save.'
until option == 'new' || option == 'load'
  option = gets.chomp.downcase
end
if option == 'new'
  word_storage = SecretWord.new
  word_storage.generate_word
  puts "I believe I didn't get your name. What is it?"
  game = Game.new(word_storage.word)
  game.set_up_name
  game.play
end
if option == 'load'
  puts 'Sorry, but save states are a work in progress!!!'
  game = Game.new
  game.load_game
  game.play
end