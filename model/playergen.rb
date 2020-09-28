require_relative 'chargen'

class Player
    include CharGen
    def initialize(name:)
        @playerName = name
        @playerGold = 0
        @playerBalance = 0
        @stats = {}
    end

    def race(job_stats)
        @stats = job_stats
    end
end

