require_relative '../view/adventure'
require_relative '../view/bank'
require_relative '../view/store'
require_relative '../view/leaderboard'

def townOpt(input)
    case input
    when 1
        adventure
    when 2
        bank
    when 3
        store
    when 4
        leaderboard
    end
end