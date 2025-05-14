class Player
  attr_reader :name
  attr_accessor :guess_history

  def initialize(name)
    @name = name
    @guess_history = []
  end

  def guesses(guess)
    puts 'What letter do you think is in the word. If you want to save. Type in "save"'
    puts "You have guessed: #{self.guess_history}" if self.guess_history != []
    current_guess = gets.chomp.downcase
    until current_guess.length == 1 || current_guess == 'save'
      puts 'Invalid, try again.'
      current_guess = gets.chomp.downcase
    end
    if current_guess != 'save'
      self.guess_history.push(current_guess)
    end
    guess.replace(current_guess)
  end
  

end