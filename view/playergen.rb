class Player
    def initialize(name:)
        @playerName = name
        @playerHP = 10
        @playerStr = 0
        @playerAgi = 0
        @playerInt = 0
        @playerDex = 0
        @playerLck = 0
        @playerGold = 0
        @playerBalance = 0

    end
end

playerTemp = Player.new(name: 'Horus')
p playerTemp
File.write("playerdata.yaml", playerTemp)