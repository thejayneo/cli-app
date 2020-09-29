require_relative '../router/town'
require 'yaml'

module Town
    def self.menu
        system 'clear'
        player = YAML.load(File.read("view/playerdata.yml"))
        puts "Welcome to Hazelwood, #{player.playerName}!"
        puts "You see the villagers quietly going about their day as a few adventurers gather around the leaderboard."
        puts "What would you like to do? (Select 1-5)"
        puts "1. Adventure - Patrol the outskirts; be ready for a fight!"
        puts "2. Bank - Stow your precious gold away or make a withdrawal."
        puts "3. Store - Purchase equipment."
        puts "4. Leaderboard - See if you made the leaderboard!"
        puts "5. Quit"
        input = gets.chomp.to_i
        # this guard statement is ugly.
        input.between?(1,5) ? ::TownRouter.option(input) : "#{system 'clear'}, #{puts 'Invalid input'}, #{sleep(2)}, #{::Town.menu}"
    end
end

