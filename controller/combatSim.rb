require_relative '../view/town'
require_relative '../view/adventure'
require_relative '../model/playergen'
require 'yaml'

module CombatSim
    def self.start(mob1)
        #Load player stats
            player = YAML.load(File.read("view/playerdata.yml"))
            playerStats = player.stats
            @currentPlayerHP = playerStats.fetch(:HP)
            @currentPlayerStr = playerStats.fetch(:Str)
            @currentPlayerAgi = playerStats.fetch(:Agi)
            @currentPlayerInt = playerStats.fetch(:Int)
            @currentPlayerDex = playerStats.fetch(:Dex)
            @currentPlayerLck = playerStats.fetch(:Lck)
        #Load mob stats
            mobStats = mob1.stats
            @currentMobHP = mobStats.fetch(:HP)
            @currentMobStr = mobStats.fetch(:Str)
            @currentMobAgi = mobStats.fetch(:Agj)
            @currentMobInt = mobStats.fetch(:Int)
            @currentMobDex = mobStats.fetch(:Dex)
            @currentMobLck = mobStats.fetch(:Lck)
        #Decide first-turn initiative
            if @currentPlayerAgi > @currentMobAgi;
                @turn = 'player'
            else
                @turn = 'mob'
            end
    end

    def turnHandler
        until victory || defeat
            turn = (turn == 'player') ? 'mob' : 'player'
            print_board(board)
            player_move!(player, board)
            winner = check_for_winner(board)
            draw = is_draw?(board) unless winner
            system 'clear'
            break if victory || defeat
        end 
    end

    def turnExecute
    end

    def reward
    end
end