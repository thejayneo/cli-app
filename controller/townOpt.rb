require_relative '../view/adventure'
require_relative '../view/bank'
require_relative '../view/store'
require_relative '../view/leaderboard'

module Menu
    def townOpt
        case @input
        when 1
            ::Adventure.start
        when 2
            ::Bank.start
        when 3
            ::Store.start
        when 4
            ::Leaderboard.start
        end
    end
    module_function :townOpt
end