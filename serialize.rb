require 'yaml'
require_relative 'lib/game-mechanics'

module Serialize
  def load_game
      if File.zero?('saved_game/only_save_file.yml') == true
        puts "You haven't played a game yet. Please try opening the game again and play a new game."
      else
        data = YAML.load(File.read('./saved_game/only_save_file.yml'))
        @answer = data[:answer]
        @player.name = data[:player_name]
        @player.guess_history = data[:player_guess_history]
        @hidden_array = data[:hidden_array]
        @wrong_guesses = data[:wrong_guesses]
        @status = data[:status]
      end
  end


  def to_yaml
    File.open("saved_game/only_save_file.yml", 'w') do |save_file|
      YAML.dump({
        :answer => @answer,
        :player_name => @player.name,
        :player_guess_history => @player.guess_history,
        :hidden_array => @hidden_array,
        :wrong_guesses => @wrong_guesses,
        :status => @status
      }, save_file)
    end
    puts "The game is saved."
  end
end