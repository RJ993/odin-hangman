require_relative 'game-elements/secret_word'
require_relative 'game-elements/player'
require_relative 'game-elements/images'
require_relative '../serialize'
require 'yaml'

class Game
  attr_accessor :answer, :player, :hidden_array, :wrong_guesses, :status

  include Image
  include Serialize

  def initialize(word_storage = '')
    @answer = word_storage
    @player = Player.new
    @hidden_array = []
    @wrong_guesses = 0
    @status = false
  end

  def set_up_name
    player.name = gets.chomp
  end

  def instruct
    puts 'The main goal is to guess the correct word. Be careful! If the human is fully hanged, you lose!'
  end

  def play
    prepare_hidden_array(hidden_array)
    instruct
    display_image
    until wrong_guesses == 6 || status == true
      process_guess
      display_image
    end
  end

  def prepare_hidden_array(hidden_array)
    return unless hidden_array == []

    underscore_counter = answer.length
    underscore_counter.times { hidden_array.push('_') }
  end

  def process_guess
    guess = ''
    player.guesses(guess)
    compare(guess)
    declare_victory_or_loss(hidden_array, answer, wrong_guesses)
  end

  def compare(guess)
    if guess != 'save'
      correct_letters = answer.split('')
      correct?(guess, correct_letters)
      incorrect?(guess, correct_letters)
      puts ''
      puts hidden_array.join(' ')
      puts ''
    end
    return unless guess == 'save'

    to_yaml
  end

  def correct?(guess, correct_letters)
    correct_letters.each_with_index do |letter, position|
      if letter == guess
        hidden_array.delete_at(position)
        hidden_array.insert(position, letter)
      end
    end
  end

  def incorrect?(guess, correct_letters)
    return unless correct_letters.include?(guess) == false

    puts 'The letter is not in the word'
    self.wrong_guesses += 1
  end

  def declare_victory_or_loss(hidden_array, answer, wrong_guesses)
    joined_answer = hidden_array.join
    if joined_answer == answer
      puts "#{player.name} has won!"
      self.status = true
    end
    return unless wrong_guesses == 6

    puts "#{player.name} has lost!"
    puts "The word was #{answer}."
  end

  def display_image
    case self.wrong_guesses
    when 0
      display_zero
    when 1
      display_one
    when 2
      display_two
    when 3
      display_three
    when 4
      display_four
    when 5
      display_five
    when 6
      display_six
    end
  end
end
