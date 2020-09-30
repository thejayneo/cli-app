require_relative 'chargen'

class Player
    include CharGen
    attr_reader :playerName
    attr_accessor :playerGold, :playerBalance, :playerWeapon, :playerArmour, :stats, :achievement
    def initialize(name:)
        @playerName = name
        @playerGold = 0
        @playerBalance = 0
        @playerWeapon = nil
        @playerArmour = nil
        @achievement = []
        @stats = {}
    end

    def race(job_stats)
        @stats = job_stats
    end

end

