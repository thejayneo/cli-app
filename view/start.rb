system 'clear'
puts "Welcome to 'Legend of the Ruby Dragon', a CLI remake of the famous text-based adventure game, 'Legend of the Green Dragon'."
sleep(3)
if File.zero?('playerdata.rb') == true
    puts 'No previous player data found.'
    chargen
else
    system 'clear'
    puts 'Player data located.'
    sleep(2)
    system 'clear'
    puts 'Spawning'
    sleep(1)
    system 'clear'
    puts 'Spawning.'
    sleep(1)
    system 'clear'
    puts 'Spawning..'
    sleep(1)
    system 'clear'
    puts 'Spawning...'
    sleep(1)
    system 'clear'
    require_relative 'town'
end