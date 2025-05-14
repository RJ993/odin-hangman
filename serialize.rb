require 'yaml'
require_relative 'lib/game-mechanics'

module Serialize
  def to_yaml
    File.open("saved_game/only_save_file.yml", 'w') do |save_file|
      YAML::dump({
        :answer => @answer,
        :player => @player,
        :player_name => @player.name,
        :player_guess_history => @player.guess_history,
        :hidden_array => @hidden_array,
        :wrong_guesses => @wrong_guesses,
        :status => @status
      }, save_file)
    end
  end
end