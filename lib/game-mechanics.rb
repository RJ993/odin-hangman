class Game
  attr_accessor :word

  def initialize
    @word
  end

  def word_generator
    File.open("dictionary/google-10000-english-usa-no-swears.txt") do |word_list|  
      random_number = rand(0..9881)
      @word = (word_list.readlines()[random_number]).chomp
      end
  end
end