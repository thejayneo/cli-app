require_relative 'CharGen'

class Player < CharGen
    super race: race, job: job

    def initialize(hp: nil, str: nil, agi: nil, int: nil, dex: nil,lck: nil, gold: 0, balance: 0)
        @name = playerName
        @hp = playerHP
        @str = playerStr
        @agi = playerAgi
        @int = playerInt
        @dex = playerDex
        @lck = playerLck
        @gold = playerGold
        @balance = balance
    end
end