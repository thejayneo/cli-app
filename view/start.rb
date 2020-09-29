require_relative 'town'
require_relative '../view/newplayer'
require 'colorize'
require 'artii'

system 'clear'
titleStyle = Artii::Base.new :font => 'slant'
puts titleStyle.asciify('              Legend')
puts titleStyle.asciify('              Of The')
puts titleStyle.asciify('               Ruby').colorize(:red)                                                                                                                             
puts titleStyle.asciify('            Dragon')
puts "\n"*2 + "A CLI remake of the text-based adventure game, #{"'Legend of the Green Dragon' (LotGD)".colorize(:green)}."
sleep(5)
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
    puts "Player data located. Welcome back," +"\n"*4 + "#{(titleStyle.asciify(player.playerName)).colorize(:yellow)}"
    sleep(3)
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