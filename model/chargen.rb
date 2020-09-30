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

    def god
        {HP: 99999, Str: 999, Agi: 999, Int: 999, Dex: 999, Lck: 999}
    end

    def beast
        {HP: 66666, Str: 666, Agi: 666, Int: 666, Dex: 666, Lck: 666}
    end

    def race_base(input)
        case input
            when 1 then elf
            when 2 then human
            when 3 then dwarf
            when 666 
                system 'clear'
                puts 'Number of the Beast acknowledged. BEAST MODE ACTIVATED.'
                sleep(3)
                system 'clear'
                beast
            when 777 
                system 'clear'
                puts 'Holiest number acknowledged. GOD MODE ACTIVATED.'
                sleep(3)
                system 'clear'
                god
            else 
                system 'clear'
                puts "Invalid input. Please select a valid option (1-3)."
                sleep(3)
                system 'clear'
                ::NewPlayer.raceselect
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
    module_function :race_base, :job, :elf, :human, :dwarf, :god, :beast
end