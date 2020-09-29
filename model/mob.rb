require_relative 'CharGen'

class Mob
    attr_accessor :stats
    def initialize
    end

    def statsGen
        # Mob race generation
        race_select = rand(1..3)
        mob_race = ::CharGen.race_base(race_select)
        # Mob job selection + race stats passed through
        job_select = rand(1..4)
        @stats = ::CharGen.job(job_select, race_base: mob_race)
        #Mob name
        race_array = ['Elven', 'Human', 'Dwarven']
        job_array = ['Mage', 'Knight', 'Rogue', 'Archer']
        @name = race_array[(race_select) - 1].to_s + " " + job_array[(job_select) - 1].to_s
    end

    def name
        @name
    end

    def stats
        @stats
    end
end
