module CharGen
    def race(input)
        case input
        when 'elf'
            @HP = 20
            @Str = 10
            @Agi = 30
            @Int = 10
            @Dex = 30
            @Lck = 10
        when 'human'
            @HP = 20
            @Str = 20
            @Agi = 10
            @Int = 20
            @Dex = 20
            @Lck = 20
        when 'dwarf'
            @HP = 30
            @Str = 25
            @Agi = 15
            @Int = 10
            @Dex = 10
            @Lck = 20
        end
    end

    def job(input)
        case input
        when 'mage'
            @playerHP += 0
            @playerStr += 0
            @playerAgi += 0
            @playerInt += 15
            @playerDex += 15
            @playerLck += 0
        when 'knight'
            @playerHP += 15
            @playerStr += 15
            @playerAgi += 0
            @playerInt += 0
            @playerDex += 0
            @playerLck += 0
        when 'rogue'
            @playerHP += 0
            @playerStr += 0
            @playerAgi += 15
            @playerInt += 0
            @playerDex += 0
            @playerLck += 15
        when 'archer'
            @playerHP += 0
            @playerStr += 0
            @playerAgi += 0
            @playerInt += 0
            @playerDex += 15
            @playerLck += 15
        end
    end
    module_function :race, :job
end

