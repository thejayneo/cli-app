require 'yaml'
require 'tty-prompt'
require 'colorize'
require 'artii'
require 'terminal-table'

require_relative 'town'
require_relative '../model/playergen'


module Leaderboard
    def self.start
        system 'clear'
        puts "Adventurer Scoreboard" + "\n" + "=" * 40 + "\n"*2
        @narcissist = 0
        loadIn
        render_board
        menu
    end

    def loadIn
        @player = YAML.load(File.read("view/playerdata.yml"))
        @name = @player.playerName
        @gold = @player.playerGold
        @balance = @player.playerBalance
        @weapon = @player.playerWeapon
        @armour = @player.playerArmour
        @hp = @player.stats.fetch(:HP)
        @str = @player.stats.fetch(:Str)
        @int = @player.stats.fetch(:Int)
        @agi = @player.stats.fetch(:Agi)
        @dex = @player.stats.fetch(:Dex)
        @lck = @player.stats.fetch(:Lck)
        @achievement = @player.achievement
    end

    def render_board
        rows = []
        rows << ['Gold:', @gold]
        rows << ['Bank Balance:', @balance]
        rows << ['Max Health:', @hp]
        rows << ['Strength:', @str]
        rows << ['Intelligence:', @int]
        rows << ['Agility:', @agi]
        rows << ['Dexterity:', @dex]
        rows << ['Luck:', @lck]
        @weapon == nil ? nil : rows << ['Weapon:', @weapon]
        @armour == nil ? nil : rows << ['Armour:', @armour]
        @achievement == [] ? nil : rows << ['Achievements:', @achievement]

        titleStyle = Artii::Base.new :font => 'slant'
        table = Terminal::Table.new :title => "#{(titleStyle.asciify(@name)).colorize(:yellow)}", :headings => ['Stat', 'Points'], :rows => rows, :style => {:width => 60} 
        puts table
    end

    def menu
        if (@narcissist > 3 && @achievement.include?('Narcissist') == false)
            @achievement << 'Narcissist'
            @player.achievement = @achievement
            File.open('view/playerdata.yml', 'w') {|file| File.write('view/playerdata.yml', @player.to_yaml)}
            Leaderboard::start
        else
            @narcissist += 1
        end
        prompt = TTY::Prompt.new
        prompt.select("Are you done mirin'?") do |menu|
            menu.choice "Yeah, let's get back to it...".colorize(:green), -> {::Town.menu}
            menu.choice "Nah, not yet...".colorize(:red), -> {::Leaderboard.menu}
        end
    end

    module_function :loadIn, :render_board, :menu
end