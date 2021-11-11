class Player

    def initialize
    end

    def get_guess
        puts 'Enter a guess of one letter from the ABCs'
        guess = gets.chomp.downcase
        guess
    end

end