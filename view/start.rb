require_relative 'town'
require_relative '../view/newplayer'
require 'colorize'

system 'clear'
puts "Welcome to #{'Legend of the Ruby Dragon'.colorize(:red)}, a CLI remake of the text-based adventure game, #{"'Legend of the Green Dragon' (LotGD)".colorize(:green)}."
sleep(3)
if File.size?("view/playerdata.yml") == nil
    system 'clear'
    puts 'No previous player data found. Starting player generation'
    sleep(1)
    system 'clear'
    puts 'No previous player data found. Starting player generation.'
    sleep(1)
    system 'clear'
    puts 'No previous player data found. Starting player generation..'
    sleep(1)
    system 'clear'
    puts 'No previous player data found. Starting player generation...'
    sleep(1)
    ::NewPlayer.start
else
    player = YAML.load(File.read("view/playerdata.yml"))
    system 'clear'
    puts "Player data located. Welcome back, #{player.playerName.colorize(:yellow)}"
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