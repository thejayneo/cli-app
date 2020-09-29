require_relative '../model/mob'
require_relative '../controller/combatSim'
require_relative 'town'

module Adventure
    def self.start
        # system 'clear'
        mob1 = ::Mob.new
        mob1.statsGen
        puts "You walk through the woods and you hear a rustling sound ahead. You move foward cautiously and find a #{mob1.name}."
        # sleep(3)
        ::CombatSim.start(mob1)
        # ::Town.menu
    end
end