
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
        
    end
end