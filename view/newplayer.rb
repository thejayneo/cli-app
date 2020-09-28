require_relative '../model/chargen'
require_relative '../model/playergen'
require_relative 'town'
require 'yaml'

module NewPlayer
    def start
        ::NewPlayer.raceselect
        ::NewPlayer.jobselect
        system 'clear'
        puts "What is the name of your character?"
        name = gets.chomp
        playertemp =  Player.new(name: name)
        p playertemp
        File.open('playerdata.yml', 'w') {|file| File.write(playertemp.to_yaml)}
        ::Town.menu
    end
    def raceselect
        system 'clear'
        puts 'What race would you like to play?'
        puts '1. Elf'
        puts '2. Human'
        puts '3. Dwarf'
        raceinput = gets.chomp.to_i  
        ::CharGen.race(raceinput)      
    end

    def jobselect
        system 'clear'
        puts 'What job would you like to play?'
        puts '1. Mage'
        puts '2. Knight'
        puts '3. Rogue'
        puts '4. Archer'
        jobinput = gets.chomp.to_i
        ::CharGen.job(jobinput)
    end
    module_function :start, :raceselect, :jobselect
end