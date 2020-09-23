require_relative '../model/playerdata'
require_relative 'town'

begin
	puts "#{@playerName}, welcome to Hazelwood bank!"
		active = true
		while active == true
            puts 'What would you like to do?'
            puts '1. Check my balance.'
            puts '2. Make a deposit.'
            puts '3. Make a withdrawal.'
            puts '4. Leave the bank.'
			op = gets.chomp.to_i
			if op == 1
				system 'clear'
				puts "Your balance is #{@balance} gold."
			elsif op == 2
				system 'clear'
				puts 'How much would you like to deposit?'
                dep = gets.to_i
                if dep < 0
					system 'clear'
					puts 'That is an invalid amount.'
				else
                    @balance += dep
                    puts "Your balance is now #{@balance} gold."
				end
			elsif op == 3
				system 'clear'
				puts 'How much would you like to withdraw today?'
				wdw = gets.to_i
				if wdw > @balance
					system 'clear'
					puts 'You have insufficient funds!'
				elsif wdw < 0
					system 'clear'
					puts 'That is an invalid amount.'
				else
					system 'clear'
					@balance -=wdw
					puts "You have withdrawn #{wdw} gold. Your balance is now #{@balance} gold."
				end
			elsif op == 4
				system 'clear'
				puts "Take care out there, #{@playerName}"
				active=false
			else
				system 'clear'
				puts 'Invalid selection!'
            end
        end
        # town
end
