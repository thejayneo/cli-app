require 'yaml'
require 'tty-prompt'
require 'colorize'

require_relative '../view/town'
require_relative '../view/adventure'
require_relative '../model/playergen'

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
            @mobName = mob1.name
            mobStats = mob1.stats
            @currentMobHP = mobStats.fetch(:HP)
            @currentMobStr = mobStats.fetch(:Str)
            @currentMobAgi = mobStats.fetch(:Agi)
            @currentMobInt = mobStats.fetch(:Int)
            @currentMobDex = mobStats.fetch(:Dex)
            @currentMobLck = mobStats.fetch(:Lck)
        #Decide first-turn initiative
            if @currentPlayerAgi > @currentMobAgi;
                @turn = 'player'
                puts "The #{@mobName.colorize(:red)} hasn't noticed you yet. You get ready to surprise attack them."
                sleep(3)
            else
                @turn = 'mob'
                puts "The #{@mobName.colorize(:red)} sees you and attacks you suddenly!"
                sleep(3)
            end
        turnExecute(@turn)
    end

    def turnHandler
        @victory = false
        @defeat = false

        until @victory || @defeat
            system 'clear'
            @turn = (@turn == 'player') ? 'mob' : 'player'
            turnExecute(@turn)
            break if @victory || @defeat
        end 
    end

    def turnExecute(input)
        if input == 'mob'
            mobAction = rand(1..3)
            case mobAction
            when 1
                puts "#{@mobName.colorize(:red)} swings their weapon at you!"
                if @currentMobDex - @currentPlayerAgi + rand(1..10) > 0 
                    if @currentMobLck - @currentPlayerLck > 9
                        (@currentMobStr - @currentPlayerStr) > 0 ? dmg = (@currentMobStr - @currentPlayerStr)*1.2 : dmg = 0
                        @currentPlayerHP -= dmg.to_i
                        puts "Critical hit! #{@mobName.colorize(:red)} has hit you for #{@dmg.to_i} damage!"
                    else
                        (@currentMobStr - @currentPlayerStr) > 0 ? dmg = (@currentMobStr - @currentPlayerStr) : dmg = 0
                        @currentPlayerHP -= dmg.to_i
                        puts "#{@mobName.colorize(:red)} has hit you for #{@dmg.to_i} damage!"
                    end
                else 
                    puts "You're too quick for them! They missed you!"
                end
            when 2
                puts "#{@mobName.colorize(:red)} casts a spell at you!"
                if @currentMobDex - @currentPlayerAgi + rand(1..10) > 0
                    if @currentMobLck - @currentPlayerLck > 9
                        (@currentMobInt - @currentPlayerInt) > 0 ? dmg = (@currentMobInt - @currentPlayerInt)*1.2 : dmg = 0
                        @currentPlayerHP -= dmg.to_i
                        puts "Critical hit! #{@mobName.colorize(:red)}'s spell has hit you for #{dmg.to_i} damage!"
                    else
                        (@currentMobInt - @currentPlayerInt) > 0 ? dmg = (@currentMobInt - @currentPlayerInt) : dmg = 0
                        @currentPlayerHP -= dmg.to_i
                        puts "#{@mobName.colorize(:red)}'s spell has hit you for #{dmg.to_i} damage!"
                    end
                else 
                    puts "You're too quick for them! They missed you!"
                end
            when 3
                puts "#{@mobName.colorize(:red)} aims at you with their crossbow!"
                if @currentMobDex - @currentPlayerAgi + rand(1..10) > 0
                    if @currentMobLck - @currentPlayerLck > 9
                        (@currentMobDex - @currentPlayerStr) > 0 ? dmg = (@currentMobDex - @currentPlayerStr)*1.2 : dmg = 0
                        @currentPlayerHP -= dmg.to_i
                        puts "Critical hit! #{@mobName.colorize(:red)} has hit you for #{dmg.to_i} damage!"
                    else
                        (@currentMobDex - @currentPlayerStr) > 0 ? dmg = (@currentMobDex - @currentPlayerStr) : dmg = 0
                        @currentPlayerHP -= dmg.to_i
                        puts "#{@mobName.colorize(:red)} has hit you for #{dmg.to_i} damage!"
                    end
                else 
                    puts "You're too quick for them! They missed you!"
                end
            end
        end

        if input == 'player'
            puts 'What would you like to do? (Select 1-4)'
            puts '1. Melee attack'
            puts '2. Spell attack'
            puts '3. Ranged attack'
            puts '4. Run away!'
            playerAction = gets.to_i
            system 'clear'
            # prompt = TTY::Prompt.new
            # prompt.select("What would you like to do?") do |menu|
            #     menu.choice 'Melee Attack'.colorize(:light_red), -> {::Adventure.start}
            #     menu.choice 'Cast a spell'.colorize(:light_yellow), -> {::Bank.start}
            #     menu.choice 'Ranger attack'.colorize(:light_green), -> {::Store.start}
            #     menu.choice 'Run away'.colorize(:light_blue), -> {::CombatSim.defeat}
            # end
            
            puts "Player HP: #{@currentPlayerHP}"
            puts "Mob HP: #{@currentMobHP}"
            case playerAction
            when 1
                puts "You swing your weapon at the #{@mobName.colorize(:red)}!"
                if @currentPlayerDex - @currentMobAgi + rand(1..10) > 0
                    if @currentPlayerLck - @currentMobLck > 9
                        (@currentPlayerStr - @currentMobStr) > 0 ? dmg= (@currentPlayerStr - @currentMobStr)*1.2 : dmg = 0
                        @currentMobHP -= dmg.to_i
                        puts "Critical hit! You have cleaved the #{@mobName.colorize(:red)} for #{dmg.to_i} damage!"
                    else
                        (@currentPlayerStr - @currentMobStr) > 0 ? dmg = (@currentPlayerStr - @currentMobStr) : dmg = 0
                        @currentMobHP -= dmg.to_i
                        puts "You have struck the #{@mobName.colorize(:red)} for #{dmg.to_i} damage!"
                    end
                else 
                    puts "They're too quick for you! Your weapon misses them!"
                end
            when 2
                puts "You fire a spell at the #{@mobName.colorize(:red)}!"
                if @currentPlayerDex - @currentMobAgi + rand(1..10) > 0
                    if @currentPlayerLck - @currentMobLck > 9
                        (@currentPlayerInt - @currentMobInt) > 0 ? dmg = (@currentPlayerInt - @currentMobInt)*1.2 : dmg = 0
                        @currentMobHP -= dmg.to_i
                        puts "Critical hit! Your spell evisercates the #{@mobName.colorize(:red)} for #{dmg.to_i} damage! "
                    else
                        (@currentPlayerInt - @currentMobInt) > 0 ? dmg = (@currentPlayerInt - @currentMobInt) : dmg = 0
                        @currentMobHP -= dmg.to_i
                        puts "Your spell inflicted #{dmg.to_i} damage on the #{@mobName.colorize(:red)}! "
                    end
                else 
                    puts "Drat! The shifty creature dodges your spell!"
                end
            when 3
                puts "You notch a bolt in your crossbow and aim it at the #{@mobName.colorize(:red)}."
                if @currentPlayerDex - @currentMobAgi + rand(1..10) > 0
                    if @currentPlayerLck - @currentMobLck > 9
                        (@currentPlayerDex - @currentMobStr) > 0 ? dmg = (@currentPlayerDex - @currentMobStr)*1.2 : dmg = 0
                        @currentMobHP -= dmg.to_i
                        puts "Critical hit! Your bolt penetrates their armour! You have dealt #{dmg.to_i} damage to the #{@mobName.colorize(:red)}!"
                    else
                        (@currentPlayerDex - @currentMobStr) > 0 ? dmg = (@currentPlayerDex - @currentMobStr) : dmg = 0
                        @currentMobHP -= dmg.to_i
                        puts "Your bolt penetrates their armour! You have dealt #{dmg.to_i} damage to the #{@mobName.colorize(:red)}!"
                    end
                else 
                    puts "Should have spent more time at the archery range! Your bolt whizzes past the #{@mobName.colorize(:red)} harmlessly!"
                end
            when 4
                system 'clear'
                puts "You attempt to run away"
                sleep(1)
                system 'clear'
                puts "You attempt to run away."
                sleep(1)
                system 'clear'
                puts "You attempt to run away.."
                sleep(1)
                system 'clear'
                puts "You attempt to run away..."
                sleep(1)
                if @currentPlayerAgi + rand(1..10) > @currentMobHP
                    puts "You got away safely!"
                    sleep(3)
                    ::Town.menu
                else
                    puts "Too slow! The #{@mobName.colorize(:red)} caught up to you!"
                end
            end
        end
        sleep(5)
        resolve
    end

    def resolve
        if @currentMobHP < 1
            @victory
            reward
            ::Town.menu
        elsif @currentPlayerHP < 1
            @defeat
            loss
            ::Town.menu
        else
            turnHandler
        end
    end

    def reward
        player = YAML.load(File.read("view/playerdata.yml"))
        drop = rand(500..1000)
        player.playerGold += drop
        File.open('view/playerdata.yml', 'w') {|file| File.write('view/playerdata.yml', player.to_yaml)}
        puts "Congratulations, you have defeated the #{@mobName.colorize(:red)}! Rummaging their corpse you have found #{drop} gold."
        sleep(3)
    end

    def loss
        player = YAML.load(File.read("view/playerdata.yml"))
        player.playerGold = 0
        File.open('view/playerdata.yml', 'w') {|file| File.write('view/playerdata.yml', player.to_yaml)}
        puts "You have been defeated by the overwhelming power of the #{@mobName.colorize(:red)}! You have lost all the gold you were carrying."
        sleep(3)
        puts "Respawning"
        sleep(2)
        system 'clear'
        puts "Respawning."
        sleep(2)
        system 'clear'
        puts "Respawning.."
        sleep(2)
        system 'clear'
        puts "Respawning..."
        sleep(2)
    end

    module_function :turnExecute, :turnHandler, :resolve, :reward, :loss
end