require 'yaml'
require 'tty-prompt'
require 'colorize'

require_relative 'adventure'
require_relative 'bank'
require_relative 'store'
require_relative 'leaderboard'

module Town
    def self.menu
        system 'clear'
        player = YAML.load(File.read("view/playerdata.yml"))
        puts "Welcome to #{'Hazelwood'.colorize(:magenta)}, #{player.playerName.colorize(:yellow)}!"
        puts "=" * 40 + "\n"*2
        puts "You see the villagers quietly going about their day as a few adventurers gather around the leaderboard." + "\n"*2
        prompt = TTY::Prompt.new
        prompt.select("What would you like to do?") do |menu|
            menu.choice 'Adventure'.colorize(:green), -> {::Adventure.start}
            menu.choice 'Bank'.colorize(:yellow), -> {::Bank.start}
            menu.choice 'Store'.colorize(:blue), -> {::Store.start}
            menu.choice 'Leaderboard'.colorize(:light_magenta), 4
            menu.choice 'Quit'.colorize(:red), -> {!exit}
        end
    end
end
