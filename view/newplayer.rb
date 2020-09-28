require_relative '../model/chargen'
require_relative '../model/playergen'
require_relative 'town'
require 'yaml'

module NewPlayer
    def start
        race_select = ::NewPlayer.raceselect
        job_select = ::NewPlayer.jobselect race_select
        system 'clear'
        puts "What is the name of your character?"
        name = gets.chomp
        player = Player.new(name: name)
        player.race(job_select)
        File.open('view/playerdata.yml', 'w') {|file| File.write('view/playerdata.yml', player.to_yaml)}
        ::Town.menu
    end

    def raceselect
        system 'clear'
        puts 'What race would you like to play?'
        puts '1. Elf'
        puts '2. Human'
        puts '3. Dwarf'
        raceinput = gets.chomp.to_i  
        ::CharGen.race_base(raceinput)      
    end

    def jobselect(race)
        system 'clear'
        puts 'What job would you like to play?'
        puts '1. Mage'
        puts '2. Knight'
        puts '3. Rogue'
        puts '4. Archer'
        jobinput = gets.chomp.to_i
        ::CharGen.job(jobinput, race_base: race)
    end
    module_function :start, :raceselect, :jobselect
end