require 'yaml'
require 'tty-prompt'
require 'colorize'
require 'artii'

require_relative '../model/playergen.rb'
require_relative 'town'

module Store
    def self.start 
        menu
    end

    def menu
        system 'clear'
        puts "Hephy's Forge" + "\n" + "=" * 40 + "\n"*2
        prompt = TTY::Prompt.new
        prompt.select("What would you like to buy today?") do |menu|
            menu.choice 'Weapons'.colorize(:light_red), -> {::Store.weapons_list}
            menu.choice 'Armour'.colorize(:light_yellow), -> {::Store.armour_list}
            menu.choice '"Not buying today, just want to look around!"'.colorize(:light_green), -> {::Store.kick}
            menu.choice 'Leave'.colorize(:light_blue), -> {::Store.leave}
        end
    end

    def weapons_list
        system 'clear'
        puts "Hephy's Forge -> Weapons Menu" + "\n" + "=" * 40 + "\n"*2
        @weap_stats = {
            "Sharpened Stake (Str + 10)":{ 
                tier: 1, cost: 100, playerStr: 10, playerAgi: 0, playerInt: 0, playerDex: 0, playerLck: 0
            }, 
            "Tree Branch (Int + 10)":{ 
                tier: 1, cost: 100, playerStr: 0, playerAgi: 0, playerInt: 10, playerDex: 0, playerLck: 0
            },
            "Fish Bone (Str + 5, Agi + 5)":{ 
                tier: 1, cost: 100, playerStr: 5, playerAgi: 5, playerInt: 0, playerDex: 0, playerLck: 0
            },
            "Sling Shot (Dex + 10)":{
                tier: 1, cost: 100, playerStr: 0, playerAgi: 0, playerInt: 0, playerDex: 10, playerLck: 0
            }
        }
        weap_list = @weap_stats.keys
        prompt = TTY::Prompt.new
        prompt.select("Here's what we have in stock today:") do |menu|
            weap_list.each do |name|
            menu.choice "#{name} - Cost: #{@weap_stats.fetch(name).fetch(:cost)} gold", -> {::Store.weapons_buy(name)}
            end
        end
    end

    def weapons_buy(item)
        system 'clear'
        puts "Hephy's Forge -> Weapons Menu -> Weapon Purchase" + "\n" + "=" * 40 + "\n"*2
        player = YAML.load(File.read("view/playerdata.yml"))
        gold = player.playerGold
        weapon = player.playerWeapon
        # playerStats = player.stats
        str = player.stats.fetch(:Str)
        int = player.stats.fetch(:Int)
        agi = player.stats.fetch(:Agi)
        dex = player.stats.fetch(:Dex)
        lck = player.stats.fetch(:Lck)
        cost = @weap_stats.fetch(item).fetch(:cost).to_i
            if cost > gold
                puts 'Hephy looks at you and says, "Hey, hey! I\'m not running a charity here!"'
                sleep(3)
                system 'clear'
                ::Store.menu
            else 
                if weapon != nil
                    str += @weap_stats.fetch(item).fetch(:playerStr) - @weap_stats.fetch(weapon).fetch(:playerStr) 
                    agi += @weap_stats.fetch(item).fetch(:playerAgi) - @weap_stats.fetch(weapon).fetch(:playerAgi)
                    int += @weap_stats.fetch(item).fetch(:playerInt) - @weap_stats.fetch(weapon).fetch(:playerInt)
                    dex += @weap_stats.fetch(item).fetch(:playerDex) - @weap_stats.fetch(weapon).fetch(:playerDex)
                    lck += @weap_stats.fetch(item).fetch(:playerLck) - @weap_stats.fetch(weapon).fetch(:playerLck)
                else
                    str += @weap_stats.fetch(item).fetch(:playerStr)
                    agi += @weap_stats.fetch(item).fetch(:playerAgi)
                    int += @weap_stats.fetch(item).fetch(:playerInt)
                    dex += @weap_stats.fetch(item).fetch(:playerDex)
                    lck += @weap_stats.fetch(item).fetch(:playerLck)
                end
                puts "You threw away your #{weapon} and picked up the gleaming #{item}!"
                gold -= cost
                weapon = item
            end
        player.playerGold = gold
        player.playerWeapon = weapon
        player.stats[:Str] = str
        player.stats[:Agi] = agi
        player.stats[:Dex] = dex
        player.stats[:Int] = int
        player.stats[:Lck] = lck
        File.open('view/playerdata.yml', 'w') {|file| File.write('view/playerdata.yml', player.to_yaml)}
        sleep(3)
        ::Store.menu
    end


    def armour_list
        system 'clear'
        puts "Hephy's Forge -> Armours Menu" + "\n" + "=" * 40 + "\n"*2
        @arm_stats = {
            "Paper Bag (HP + 10, Dex - 5)":{ 
                tier: 1, cost: 100, playerHP: 10, playerStr: 0, playerAgi: 0, playerInt: 0, playerDex: -5, playerLck: 0
            }, 
            "Cardboard Box (HP + 10, Str + 5)":{ 
                tier: 1, cost: 250, playerHP: 10, playerStr: 5, playerAgi: 0, playerInt: 00, playerDex: 0, playerLck: 0
            },
            "Fishing Net (HP + 15, Agi - 5)":{ 
                tier: 1, cost: 100, playerHP: 15, playerStr: 0, playerAgi: -5, playerInt: 0, playerDex: 0, playerLck: 0
            },
            "Birthday Suit (Lck + 20)":{
                tier: 2, cost: 400, playerHP: 0, playerStr: 0, playerAgi: 0, playerInt: 0, playerDex: 0, playerLck: 20
            }
        }
        arm_list = @arm_stats.keys
        prompt = TTY::Prompt.new
        prompt.select("Here's what we have in stock today:") do |menu|
            arm_list.each do |name|
            menu.choice "#{name} - Cost: #{@arm_stats.fetch(name).fetch(:cost)} gold", -> {::Store.armour_buy(name)}
            end
        end
    end

    def armour_buy(item)
        system 'clear'
        puts "Hephy's Forge -> Armours Menu -> Armour Purchase" + "\n" + "=" * 40 + "\n"*2
        player = YAML.load(File.read("view/playerdata.yml"))
        gold = player.playerGold
        armour = player.playerArmour
        hp = player.stats.fetch(:HP)
        str = player.stats.fetch(:Str)
        int = player.stats.fetch(:Int)
        agi = player.stats.fetch(:Agi)
        dex = player.stats.fetch(:Dex)
        lck = player.stats.fetch(:Lck)
        cost = @arm_stats.fetch(item).fetch(:cost).to_i
            if cost > gold
                puts 'Hephy looks at you and says, "Hey, hey! I\'m not running a charity here!"'
                sleep(3)
                system 'clear'
                ::Store.menu
            else 
                if armour != nil
                    hp += @arm_stats.fetch(item).fetch(:playerHP) - @arm_stats.fetch(armour).fetch(:playerHP) 
                    str += @arm_stats.fetch(item).fetch(:playerStr) - @arm_stats.fetch(armour).fetch(:playerStr) 
                    agi += @arm_stats.fetch(item).fetch(:playerAgi) - @arm_stats.fetch(armour).fetch(:playerAgi)
                    int += @arm_stats.fetch(item).fetch(:playerInt) - @arm_stats.fetch(armour).fetch(:playerInt)
                    dex += @arm_stats.fetch(item).fetch(:playerDex) - @arm_stats.fetch(armour).fetch(:playerDex)
                    lck += @arm_stats.fetch(item).fetch(:playerLck) - @arm_stats.fetch(armour).fetch(:playerLck)
                else
                    hp += @arm_stats.fetch(item).fetch(:playerHP)
                    str += @arm_stats.fetch(item).fetch(:playerStr)
                    agi += @arm_stats.fetch(item).fetch(:playerAgi)
                    int += @arm_stats.fetch(item).fetch(:playerInt)
                    dex += @arm_stats.fetch(item).fetch(:playerDex)
                    lck += @arm_stats.fetch(item).fetch(:playerLck)
                end
                puts "You discarded your #{armour} and put on the shiny #{item}!"
                gold -= cost
                armour = item
            end
        player.playerGold = gold
        player.playerArmour = armour
        player.stats[:HP] = hp
        player.stats[:Str] = str
        player.stats[:Agi] = agi
        player.stats[:Dex] = dex
        player.stats[:Int] = int
        player.stats[:Lck] = lck
        File.open('view/playerdata.yml', 'w') {|file| File.write('view/playerdata.yml', player.to_yaml)}
        sleep(3)
        ::Store.menu
    end

    def kick
        system 'clear'
        puts "Hephy's Forge" + "\n" + "=" * 40 + "\n"*2
        puts '"Does this look like an art gallery to you? Scram!"'
        sleep(3)
        ::Town.menu
    end

    def leave
        system 'clear'
        player = YAML.load(File.read("view/playerdata.yml"))
        puts "Hephy's Forge" + "\n" + "=" * 40 + "\n"*2
        puts "Stay alive out there, #{player.playerName.colorize(:yellow)}!"
        sleep(3)
        ::Town.menu
    end

    module_function :weapons_list, :armour_list, :weapons_buy, :armour_buy, :leave, :menu, :kick
end