class Player
  attr_reader :name
  attr_accessor :guess_history

  def initialize(name)
    @name = name
    @guess_history = []
  end

  def guesses(guess)
    puts 'What letter do you think is in the word'
    puts "You have guessed: #{self.guess_history}" if self.guess_history != []
    current_guess = gets.chomp.downcase
    until current_guess.length == 1
      puts 'Invalid, try again.'
      current_guess = gets.chomp.downcase
    end
    self.guess_history.push(current_guess)
    guess.replace(current_guess)
  end
  

end