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
        loadIn
        render_board
        menu
    end

    def loadIn
        player = YAML.load(File.read("view/playerdata.yml"))
        @name = player.playerName
        @gold = player.playerGold
        @balance = player.playerBalance
        @weapon = player.playerWeapon
        @armour = player.playerArmour
        @hp = player.stats.fetch(:HP)
        @str = player.stats.fetch(:Str)
        @int = player.stats.fetch(:Int)
        @agi = player.stats.fetch(:Agi)
        @dex = player.stats.fetch(:Dex)
        @lck = player.stats.fetch(:Lck)
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
        rows << ['Weapon:', @weapon]
        rows << ['Armour:', @armour]
        
        titleStyle = Artii::Base.new :font => 'slant'
        table = Terminal::Table.new :title => "#{(titleStyle.asciify(@name)).colorize(:yellow)}", :headings => ['Stat', 'Points'], :rows => rows, :style => {:width => 50} 
        puts table
    end

    def menu
    end

    module_function :loadIn, :render_board, :menu
end