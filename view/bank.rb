require_relative 'town'

module Bank
	def self.start
		# File.open("view/playerdata.yml", "r")
        player = YAML.load(File.read("view/playerdata.yml"))
		balance = player.playerBalance.to_i
		gold = player.playerGold.to_i
		puts "#{player.playerName}, welcome to Hazelwood bank!"
			active = true
			while active == true
				puts 'What would you like to do today?'
				puts '1. Check my balance.'
				puts '2. Make a deposit.'
				puts '3. Make a withdrawal.'
				puts '4. Leave the bank.'
				op = gets.chomp.to_i
				if op == 1
					system 'clear'
					puts "You are carrying #{gold} gold and your bank balance is #{balance} gold."
				elsif op == 2
					system 'clear'
					puts 'How much would you like to deposit?'
					dep = gets.to_i
					if dep < 0
						system 'clear'
						puts 'That is an invalid amount.'
					elsif dep > gold
						system 'clear'
						puts "You don't have enough gold."
					else
						balance += dep
						gold -= dep
						puts "Your balance is now #{balance} gold."
					end
				elsif op == 3
					system 'clear'
					puts 'How much would you like to withdraw today?'
					wdw = gets.to_i
					if wdw > balance
						system 'clear'
						puts 'You have insufficient funds!'
					elsif wdw < 0
						system 'clear'
						puts 'That is an invalid amount.'
					else
						system 'clear'
						balance -=wdw
						gold += wdw
						puts "You have withdrawn #{wdw} gold. Your balance is now #{balance} gold."
					end
				elsif op == 4
					system 'clear'
					player.playerBalance = balance
					player.playerGold = gold
					File.open('view/playerdata.yml', 'w') {|file| File.write('view/playerdata.yml', player.to_yaml)}
					puts "Take care out there, #{player.playerName}"
					active=false
					::Town.menu
				else
					system 'clear'
					puts 'Invalid selection!'
				end
		end
	end
end
