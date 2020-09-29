
module Store
    def self.start
        player = YAML.load(File.read("view/playerdata.yml"))
		gold = player.playerGold.to_i
        puts "store"
end