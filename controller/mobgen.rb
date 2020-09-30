require_relative '../model/race'
require_relative '../model/job'
require_relative '../model/mob'

module MobGen
    def mob(number:nil)
        mob = Mob.new
        mob.raceGen
        mob.jobGen
        mob.name
        mob
    end
    module_function :mob
end
