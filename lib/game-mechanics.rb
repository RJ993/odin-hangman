require_relative 'game-elements/secret_word'
require_relative 'game-elements/player'

class Game
attr_reader :answer, :player, :player_name
attr_accessor :hidden_array, :wrong_guesses, :status

  def initialize(word_storage, player, player_name)
    @answer = word_storage
    @player = player
    @player_name = player_name
    @hidden_array = []
    @wrong_guesses = 0
    @status = false
  end

  def play
    prepare_hidden_array(self.hidden_array)
    until self.wrong_guesses == 6 || self.status == true
      process_guess
    end
  end

  def prepare_hidden_array(hidden_array)
    underscore_counter = (self.answer.length)
    underscore_counter.times {hidden_array.push('_')} 
  end

  def process_guess
    guess = ''
    player.guesses(guess)
    compare(guess)
    declare_victory_or_loss(self.hidden_array, self.answer, self.wrong_guesses)
  end

  def compare(guess)
    correct_letters = self.answer.split("")
    correct?(guess, correct_letters)
    incorrect?(guess, correct_letters)
    puts self.hidden_array.join(" ")
  end

  def correct?(guess, correct_letters)
    correct_letters.each_with_index do |letter, position|
      if letter == guess
        self.hidden_array.delete_at(position)
        self.hidden_array.insert(position, letter)
      end
    end
  end

  def incorrect?(guess, correct_letters)
    if correct_letters.include?(guess) == false
      puts "The letter is not in the word"
      self.wrong_guesses += 1
    end
  end

  def declare_victory_or_loss(hidden_array, answer, wrong_guesses)
    joined_answer = hidden_array.join
    if joined_answer == answer
      puts "#{self.player_name} has won!"
      self.status = true
    end
    if wrong_guesses == 6
      puts "#{self.player_name} has lost!"
    end
  end

end