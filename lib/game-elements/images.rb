module Image
  def initialize
    
  end

  def display_zero
    puts ""
    puts " |-----|"
    puts " |     |"
    puts " |"
    puts " |"
    puts " |"
    puts ""
  end

  def display_one
    puts ""
    puts "|-----|"
    puts "|     |"
    puts "|     O"
    puts "|"
    puts "|"
    puts ""
  end

  def display_two
    puts ""
    puts "|-----|"
    puts "|     |"
    puts '|     O'
    puts '|     |'
    puts "|"
    puts ""
  end
  
  def display_three
    puts ""
    puts "|-----|"
    puts "|     |"
    puts '|     O'
    puts '|    /|'
    puts "|"
  end

  def display_four
    puts "|-----|"
    puts "|     |"
    puts '|     O'
    puts '|    /|\\'
    puts "|"
    puts ""
  end

  def display_five
    puts ""
    puts "|-----|"
    puts "|     |"
    puts '|     O'
    puts '|    /|\\'
    puts '|    /'
  end

  def display_six
    puts "|-----|"
    puts "|     |"
    puts '|     O'
    puts '|    /|\\'
    puts '|    / \\'
    puts ""
  end
end