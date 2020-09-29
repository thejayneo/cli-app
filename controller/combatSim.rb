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
                puts "The #{@mobName} hasn't noticed you yet. You get ready to surprise attack them."
                sleep(3)
            else
                @turn = 'mob'
                puts "The #{@mobName} sees you and attacks you suddenly!"
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
                puts "#{@mobName} swings their weapon at you!"
                if @currentMobDex - @currentPlayerAgi + rand(1..10) > 0 
                    if @currentMobLck - @currentPlayerLck > 9
                        dmg = (@currentMobStr - @currentPlayerStr)*1.2
                        @currentPlayerHP -= dmg.to_i
                        puts "Critical hit! #{@mobName} has hit you for #{@dmg.to_i} damage!"
                    else
                        dmg = (@currentMobStr - @currentPlayerStr)
                        @currentPlayerHP -= dmg.to_i
                        puts "#{@mobName} has hit you for #{@dmg.to_i} damage!"
                    end
                else 
                    puts "You're too quick for them! They missed you!"
                end
            when 2
                puts "#{@mobName} casts a spell at you!"
                if @currentMobDex - @currentPlayerAgi + rand(1..10) > 0
                    if @currentMobLck - @currentPlayerLck > 9
                        dmg = (@currentMobInt - @currentPlayerInt)*1.2
                        @currentPlayerHP -= dmg.to_i
                        puts "Critical hit! #{@mobName}'s spell has hit you for #{dmg.to_i} damage!"
                    else
                        dmg = (@currentMobInt - @currentPlayerInt)
                        @currentPlayerHP -= dmg.to_i
                        puts "#{@mobName}'s spell has hit you for #{dmg.to_i} damage!"
                    end
                else 
                    puts "You're too quick for them! They missed you!"
                end
            when 3
                puts "#{@mobName} aims at you with their crossbow!"
                if @currentMobDex - @currentPlayerAgi + rand(1..10) > 0
                    if @currentMobLck - @currentPlayerLck > 9
                        dmg = (@currentMobDex - @currentPlayerStr)*1.2
                        @currentPlayerHP -= dmg.to_i
                        puts "Critical hit! #{@mobName} has hit you for #{dmg.to_i} damage!"
                    else
                        dmg = (@currentMobDex - @currentPlayerStr)
                        @currentPlayerHP -= dmg.to_i
                        puts "#{@mobName} has hit you for #{dmg.to_i} damage!"
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
            puts "Player HP: #{@currentPlayerHP}"
            puts "Mob HP: #{@currentMobHP}"
            case playerAction
            when 1
                puts "You swing your weapon at the #{@mobName}!"
                if @currentPlayerDex - @currentMobAgi + rand(1..10) > 0
                    if @currentPlayerLck - @currentMobLck > 9
                        dmg = (@currentPlayerStr - @currentMobStr)*1.2
                        @currentMobHP -= dmg.to_i
                        puts "Critical hit! You have cleaved the #{@mobName} for #{dmg.to_i} damage!"
                    else
                        dmg = (@currentPlayerStr - @currentMobStr)
                        @currentMobHP -= dmg.to_i
                        puts "You have struck the #{@mobName} for #{dmg.to_i} damage!"
                    end
                else 
                    puts "They're too quick for you! Your weapon misses them!"
                end
            when 2
                puts "You fire a spell at the #{@mobName}!"
                if @currentPlayerDex - @currentMobAgi + rand(1..10) > 0
                    if @currentPlayerLck - @currentMobLck > 9
                        dmg = (@currentPlayerInt - @currentMobInt)*1.2
                        @currentMobHP -= dmg.to_i
                        puts "Critical hit! Your spell evisercates the #{@mobName} for #{dmg.to_i} damage! "
                    else
                        dmg = (@currentPlayerInt - @currentMobInt)
                        @currentMobHP -= dmg.to_i
                        puts "Your spell inflicted #{dmg.to_i} damage on the #{@mobName}! "
                    end
                else 
                    puts "Drat! The shifty creature dodges your spell!"
                end
            when 3
                puts "You notch a bolt in your crossbow and aim it at the #{@mobName}."
                if @currentPlayerDex - @currentMobAgi + rand(1..10) > 0
                    if @currentPlayerLck - @currentMobLck > 9
                        dmg = (@currentPlayerDex - @currentMobStr)*1.2
                        @currentMobHP -= dmg.to_i
                        puts "Critical hit! Your bolt penetrates their armour! You have dealt #{dmg.to_i} damage to the #{@mobName}!"
                    else
                        dmg = (@currentPlayerDex - @currentMobStr)
                        @currentMobHP -= dmg.to_i
                        puts "Your bolt penetrates their armour! You have dealt #{dmg.to_i} damage to the #{@mobName}!"
                    end
                else 
                    puts "Should have spent more time at the archery range! Your bolt whizzes past the #{@mobName} harmlessly!"
                end
            when 4
                puts "You attempt to run away"
                system 'clear'
                puts "You attempt to run away."
                system 'clear'
                puts "You attempt to run away.."
                system 'clear'
                puts "You attempt to run away..."
                if @currentPlayerAgi + rand(1..10) > @currentMobHP
                    puts "You safely got away!"
                    sleep(3)
                    # break
                    # ::Town.menu
                else
                    puts "Too slow! The #{mobName} caught up to you!"
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
        else
            turnHandler
        end
    end

    def reward
        player = YAML.load(File.read("view/playerdata.yml"))
        drop = rand(5..20)
        player.playerGold += drop
        File.open('view/playerdata.yml', 'w') {|file| File.write('view/playerdata.yml', player.to_yaml)}
        puts "Congratulations, you have defeated the #{@mobName}! Rummaging their corpse you have found #{drop} gold."
    end

    module_function :turnExecute, :turnHandler, :resolve, :reward
end