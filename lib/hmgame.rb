require '/home/miquel/repos/hangman/lib/hmmod.rb'

class HMGame
  # Data that describes a game:
  # - The word to guess
  # - The correct guesses
  # - The worng guesses
  # - The number of total guesses
  # The game data will be: 'word | good_guesses | bad_guesses | n_guesses
  include HMMod

  MAX_GUESSES = 8

  def initialize(game_data = "#{WORD_LIST.shuffle[0]}|||0")
    data_array = game_data.split('|')
    @word = data_array[0]
    @good_guesses = data_array[1]
    @bad_guesses = data_array[2]
    @n_guesses = data_array[3]
  end

  def display
    message = ''
    @word.length.times {|n| message += '_ '}
    @good_guesses.split.each {|char| message.gsub!('_', char)}
    message += "| #{@bad_guesses.split.join(" ")} | #{@n_guesses}/8 guesses"
    puts message
  end
end

# Testing

#g1 = HMGame.new
#g1.display
#g2 = HMGame.new('eeee|||0')
#g2.display