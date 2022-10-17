module HMMod
  WORD_LIST = File.read('/home/miquel/repos/hangman/lib/google-10000-english-no-swears.txt').split("\n").select {|word| word.length.between?(5,12)}

  def valid_input?(input)
    # Checks if the input is a single character of the english alphabet
    alphabet = "abcdefghijklmnopqrstuvwxyz".split('')
    input.length == 1 && alphabet.include?(input.downcase)
  end

  def ask_input
    puts 'Choose a letter:'
    def ask_again
      puts 'Choose a letter (has to be a single character present in the english alphabet):'
      input = valid_input?(input = gets.chomp) ? input : ask_again
    end
    input = valid_input?(input = gets.chomp) ? input : ask_again
  end

  def save_game(save_name, game_data)
    # Game data has the structure W O R D | g u e s s e s
    address = '../saves/' + save_name + '.txt'
    if File.exist?(address)
      File.delete(address)
    end
    save_file = File.open(address,"w")
    save_file.puts game_data
    save_file.close
  end
end

# Testing
include HMMod
#p WORD_LIST[0,21]
#p valid_input?('r')
#p valid_input?('5')
#p ask_input
#save_game('test', 'T _ S T S | a i o u')
#tst = File.open('./../saves/test.txt',"r")
#puts tst.read