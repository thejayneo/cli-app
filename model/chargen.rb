module CharGen
    def race(input)
        case input
        when 1
            tempStat = {HP: 20, Str: 10, Agi: 30, Int: 10, Dex: 30, Lck: 10}
        when 2
            tempStat = {HP: 20, Str: 20, Agi: 10, Int: 20, Dex: 20, Lck: 20}
        when 3
            tempStat = {HP: 30, Str: 25, Agi: 15, Int: 10, Dex: 10, Lck: 20}
        end
    end

    def job(input)
        case input
        when 1
            tempStat[:Int] = tempStat.fetch[:Int] + 15 
            tempStat[:Dex] = tempStat.fetch[:Dex] + 15 
            tempStat
        when 2
            tempStat[:HP] = tempStat.fetch[:HP] + 15
            tempStat[:Str] = tempStat.fetch[:Str] + 15
            tempStat
        when 3
            tempStat[:Agi] = tempStat.fetch[:Agi] + 15
            tempStat[:Lck] = tempStat.fetch[:Lck] + 15
            tempStat
        when 4
            tempStat[:Dex] = tempStat.fetch[:Dex] + 15 
            tempStat[:Lck] = tempStat.fetch[:Lck] + 15
            tempStat
        end
    end
    module_function :race, :job
end

