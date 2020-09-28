require_relative 'town'
require_relative '../view/newplayer'

system 'clear'
puts "Welcome to 'Legend of the Ruby Dragon', a CLI remake of the famous text-based adventure game, 'Legend of the Green Dragon'."
sleep(3)
if !File.size?("playerdata")
    system 'clear'
    puts 'No previous player data found. Starting player generation...'
    sleep(2)
    ::NewPlayer.start
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
    ::Town.menu
end