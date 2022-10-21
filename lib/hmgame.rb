require '/home/miquel/repos/hangman/lib/hmmod.rb'

class HMGame
  # Data that describes a game:
  # - The word to guess
  # - The correct guesses
  # - The worng guesses
  # - The number of total guesses
  # The game data will be: 'word|good_guesses|bad_guesses|n_guesses
  include HMMod

  attr_reader :word, :good_guesses

  MAX_GUESSES = 8

  def initialize(game_data = "#{WORD_LIST.shuffle[0]}|||0")
    data_array = game_data.split('|')
    @word = data_array[0]
    @good_guesses = data_array[1]
    @bad_guesses = data_array[2]
    @n_guesses = data_array[3].to_i
    # guesses are of the form 'sdgnt'
  end

  def display
    message = ''

    @word.split("").each do |char|
      if @good_guesses.include?(char)
        message += "#{char} "
      else
        message += "_ "
      end
    end

    message += "| #{@bad_guesses.split("").join(" ")} | #{@n_guesses}/8 guesses"
    puts message
  end

  def try(char)
    if !(@good_guesses + @bad_guesses).include?(char)
      @n_guesses += 1

      if @word.include?(char)
        @good_guesses += char
      else
        @bad_guesses += char
      end
    end
  end

  def over?
    @word.split("").uniq.sort == @good_guesses.split("").sort || @n_guesses == MAX_GUESSES
  end

  def data
    "#{@word}|#{@good_guesses}|#{@bad_guesses}|#{n_guesses}"
  end
end

# Testing

#g1 = HMGame.new('chaval|||6')
#g1.display
#g1.try 'a'
#g1.display
#p g1.over?
#g1.try 'g'
#g1.display
#p g1.over?