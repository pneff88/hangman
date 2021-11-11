require_relative "player"

class Game
    attr_accessor :word
    attr_accessor :hidden_word
    attr_accessor :attempts_left

    def hide_word(s)
        hidden_word = ''
        s.length.times do 
            hidden_word += '_'
        end
        hidden_word
    end

    def initialize
        dict_words = File.open('5deskDic.txt')
        words = dict_words.readlines
        varword = words.sample
        unless varword.length > 4 && varword.length < 13
            varword = words.sample
        end
        @word = varword.chomp
        @hidden_word = hide_word(@word)
        @player = Player.new
        @attempts_left = 10
    end

    def play_hangman
        prev_guesses = []
        until @hidden_word == @word || @attempts_left == 0
            puts "MYSTERY WORD: #{@hidden_word}"
            puts "You have #{@attempts_left} incorrect guesses remaining."
            puts "Previous Guesses: #{prev_guesses}"
            guess = @player.get_guess
            if @word.include?(guess) || @word.include?(guess.upcase)
                @word.each_char.with_index do |char,i|
                    if char.downcase == guess
                        @hidden_word[i] = @word[i] 
                    end
                    if @word == @hidden_word
                        puts "YOU WIN!" 
                    end
                end
            else 
                @attempts_left -= 1
                prev_guesses << guess
            end
        end
        if attempts_left == 0
            puts "You lose. Sucks to suck." 
        end
    end

end

