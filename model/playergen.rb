require_relative 'chargen'

class Player
    include CharGen
    def initialize(name:)

        # tempStat(:playerHP) = tempStat.delete(:HP)
        # tempStat(:playerStr) = tempStat.delete(:Str)
        # tempStat(:playerAgi) = tempStat.delete(:Agi)
        # tempStat(:playerInt) = tempStat.delete(:Int)
        # tempStat(:playerDex) = tempStat.delete(:Dex)
        # tempStat(:playerLck) = tempStat.delete(:Lck)
        @race = nil
        @playerName = name
        @playerGold = 0
        @playerBalance = 0
        @stats = {}
    end

    def race(job_stats)
        @stats = job_stats
    end
end

