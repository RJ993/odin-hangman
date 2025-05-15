class Player
  attr_accessor :name, :guess_history

  def initialize(name = 'Major Zero')
    @name = name
    @guess_history = []
  end

  def change_from_default
    self.name = gets.chomp
  end

  def guesses(guess)
    puts 'What letter do you think is in the word. If you want to save. Type in "save"'
    puts "You have guessed: #{guess_history}" if guess_history != []
    current_guess = gets.chomp.downcase
    until current_guess.length == 1 || current_guess == 'save'
      puts 'Invalid, try again.'
      current_guess = gets.chomp.downcase
    end
    guess_history.push(current_guess) if current_guess != 'save'
    guess.replace(current_guess)
  end
end
