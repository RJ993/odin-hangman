require_relative 'game-elements/secret_word'
require_relative 'game-elements/player'
require_relative 'game-elements/images'

class Game
attr_reader :answer, :player, :player_name, :image
attr_accessor :hidden_array, :wrong_guesses, :status

  def initialize(word_storage, player, player_name, image)
    @answer = word_storage
    @player = player
    @player_name = player_name
    @image = image
    @hidden_array = []
    @wrong_guesses = 0
    @status = false
  end

  def instruct
    puts "The main goal is to guess the correct word. Be careful! If the human is fully hanged, you lose!"
  end

  def play
    prepare_hidden_array(self.hidden_array)
    instruct
    display_image
    until self.wrong_guesses == 6 || self.status == true
      process_guess
      display_image
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
    puts ''
    puts self.hidden_array.join(" ")
    puts ''
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
      puts "The word was #{answer}."
    end
  end

  def display_image
    if self.wrong_guesses == 0
      image.display_zero
    elsif self.wrong_guesses == 1
      image.display_one
    elsif self.wrong_guesses == 2
      image.display_two
    elsif self.wrong_guesses == 3
      image.display_three
    elsif self.wrong_guesses == 4
      image.display_four
    elsif self.wrong_guesses == 5
      image.display_five
    elsif self.wrong_guesses == 6
      image.display_six
    end
  end

end