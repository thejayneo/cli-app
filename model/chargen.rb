module CharGen
    def elf
        {HP: 20, Str: 10, Agi: 30, Int: 10, Dex: 30, Lck: 10}
    end

    def human
        {HP: 20, Str: 20, Agi: 10, Int: 20, Dex: 20, Lck: 20}
    end

    def dwarf
        {HP: 30, Str: 25, Agi: 15, Int: 10, Dex: 10, Lck: 20}
    end

    def race_base(input)
        case input
            when 1 then elf
            when 2 then human
            when 3 then dwarf
        end
    end

    def job(input, race_base:)
        raceStat = {}.merge(race_base)
        case input
        when 1
            raceStat[:Int] = raceStat.fetch(:Int) + 15 
            raceStat[:Dex] = raceStat.fetch(:Dex) + 15 
            raceStat
        when 2
            raceStat[:HP] = raceStat.fetch(:HP) + 15
            raceStat[:Str] = raceStat.fetch(:Str) + 15
            raceStat
        when 3
            raceStat[:Agi] = raceStat.fetch(:Agi) + 15
            raceStat[:Lck] = raceStat.fetch(:Lck) + 15
            raceStat
        when 4
            raceStat[:Dex] = raceStat.fetch(:Dex) + 15 
            raceStat[:Lck] = raceStat.fetch(:Lck) + 15
            raceStat
        end
    end
    module_function :race_base, :job, :elf, :human, :dwarf
end

