require_relative '../view/adventure'
require_relative '../view/bank'
require_relative '../view/store'
# require_relative '../view/leaderboard'

module TownRouter
    def self.option(input)
        system 'clear'
        case input
        when 1
            ::Adventure.start
        when 2
            ::Bank.start
        when 3
            puts 'store'
            ::Store.start
        when 4
            puts 'leaderboard'
            ::Leaderboard.start
        when 5
            exit!
        end
    end   
end