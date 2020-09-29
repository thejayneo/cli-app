require_relative 'chargen'
require 'UUID'

class Player
    include CharGen
    attr_reader :playerName
    attr_accessor :playerGold, :playerBalance, :playerWeapon, :playerArmour, :stats
    def initialize(name:)
        @playerName = name
        @playerGold = 0
        @playerBalance = 0
        @playerWeapon = nil
        @playerArmour = nil
        @stats = {}
    end

    def race(job_stats)
        @stats = job_stats
    end
end

