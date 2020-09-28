require_relative 'chargen'

class Player
    include CharGen
    def initialize(name:)
        @playerName = name
        @playerHP = @HP
        @playerStr = @Str
        @playerAgi = @Agi
        @playerInt = @Int
        @playerDex = @Dex
        @playerLck = @Lck
        @playerGold = 0
        @playerBalance = 0
    end
end

# playerTemp = Player.new(name: 'Horus')
# File.open('playerdata.yml', 'w') {|file| File.write(playerTemp)}