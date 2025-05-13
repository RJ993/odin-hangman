class Game
  attr_accessor :word

  def initialize
    @word
  end

  def word_generator
    File.open("dictionary/google-10000-english-usa-no-swears.txt") do |word_list|  
      @word = (word_list.readlines().sample).chomp
      until (self.word).length >= 5 && (self.word).length <= 12
        word_list.rewind
        @word = (word_list.readlines().sample).chomp
      end
      end
  end
end