class Hangman
	attr_reader :lives
	attr_reader :board
	attr_reader :secret_word	
	def initialize
		@lives = 7
		@secret_word = word_list.sample
		@board = setup_board
	
	end

	def setup_board
		["_"] * secret_word.size
	end

	def word_list
		[
			"auction",
			"absolute", 
			"benefit",
			"chocolate",
			"business",
			"climate",
			"christmas",
			"confused",
			"manager",
			"vegetable",
			"evaluate",
			"license",
			"President",
			"location",
			"message",
			"sequence",
			"pattern",
			"woodland",
			"phoenix",
			"sanctuary",
			"satisfy",
		]
	end
	
	def board_state
		board.join(" ")
	end

	def make_guess
		print "Please guess a letter:"
		gets.chomp
		
	end

	def update_board(guess)
		if guess.downcase == "hint1"
			board[0] = secret_word[0]
			board[3] = secret_word[3]
			@lives -= 1
			print "\n\nYou have used the 'HINT number 1' help, 1 life has been deducted."
		elsif guess.downcase == "hint2"
			board[4] = secret_word[4]
			board[6] = secret_word[6]
			@lives -= 1
			print "\n\nYou have used the 'HINT number 2' help, 1 life has been deducted."
		elsif secret_word.include?(guess)
			i = 0
			while i < secret_word.size
				if guess.downcase == secret_word[i].downcase
					board[i] = secret_word[i]
				end
			i += 1
			end
		else
			@lives -= 1
		end
	end

	def won?
		@board.join("") == secret_word
	end

	def lost?
		lives <= 0
	end
		
	
	def start
		puts "\n\nWelcome to Hangman\n"
		puts "You have to guess a word of 7 to 9 characters.\n"
		puts "You have two help commands available."
		puts "You can use them by typing either 'hint1' or 'hint2', "
		puts "when asked 'Please guess a letter:'\n\n"
		puts "Warning any help used will deduct You 1 life."
		puts "Enjoy and have fun."
		
		# While the player has lives and has not won
		while !lost? && !won? do
		#	print the number of lives
		puts "\n\nYou have #{lives} lives left."
        
		#	print the board state
		puts board_state
		#	receive a guess
		guess = make_guess
		#	update the board
		update_board(guess)
		end
		if won?
			print "\nYou won.\n\nThe word was #{secret_word}.\n"
            print "\nDo you want to play again? (Y/N): "
            answer = gets.chomp
            if answer.downcase == "y" 
                game = Hangman.new
                game.start
			elsif answer.downcase == "n"
				print "\n\nYou've exited the game.\n\n"
                exit
			else 
                while answer.downcase != "y" || answer.downcase != "n" do
                    print "Do you want to play again? (Y/N): "
                    answer = gets.chomp
                    if answer.downcase == "y" 
                    game = Hangman.new
                    game.start
			        elsif answer.downcase == "n"
                        print "\n\nYou've exited the game.\n\n"
                        exit
                    end
                end
            end
        else
			print "\nYou lost.\n\nThe word was #{secret_word}.\n"
            print "\nDo you want to play again? (Y/N): "
            answer = gets.chomp
            if answer.downcase == "y" 
                game = Hangman.new
                game.start
			elsif answer.downcase == "n"
				print "\n\nYou've exited the game.\n\n"
                exit
			else 
                while answer.downcase != "y" || answer.downcase != "n" do
			    print "Do you want to play again? (Y/N): "
                answer = gets.chomp
				    if answer.downcase == "y" 
                    game = Hangman.new
                    game.start
			        elsif answer.downcase == "n"
                        print "\n\nYou've exited the game.\n\n"
                        exit
				    end
				end
			end
		end
	end
end


game = Hangman.new
game.start