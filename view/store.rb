
module Store
    def self.start
        player = YAML.load(File.read("view/playerdata.yml"))
		gold = player.playerGold.to_i
        puts "Welcome to Hephy's Forge!"
        puts "What would you like to buy today?"
        puts "1. Weapons"
        puts "2. Armour"
        puts '3. "Not buying today, just want to look around boss."'
        store_opt = gets.to_i
        case store_opt
            when 1 then weapons
            when 2 then armour
            when 3 then leave
            else
                system 'clear'
                puts "Huh? Are you alright there? Let me repeat myself..."
                sleep(2)
                ::Store.start
        end
    end
    

    def weapons
        weap_list = {
            sharpened_stake:{name: 'Sharpened Stake', tier: 1, cost: 100, playerStr: 10}, 
            tree_branch:{name: 'Tree Branch', tier: 1, cost: 100, playerInt: 10},
            fish_bone:{name: 'Fish bone', tier: 1, cost: 100, playerStr: 5, playerAgi: 5},
            sling_shot:{name: 'Sling shot', tier: 1, cost: 100, playerDex: 10}
        }
        puts "Here are all the finest weapons you could get:"
        puts "1. Sharpened Stake"
        puts "2. Tree Branch"
        puts "3. Fish Bone"
        puts "4. Sling Shot"
        puts "5. Back to store menu"
    end

    def armour
    end

    def leave
    end

    module_function :weapons, :armour, :leave
end