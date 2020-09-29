require_relative '../controller/townOpt'
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
        # need to figure out guard statement
        input.between?(1,5) ? ::Router.option(input) : "#{system 'clear'}, #{puts 'Invalid input'}, #{sleep(2)}, #{::Town.menu}"
        # ::Router.option(input)
    end
end

