require_relative "../../model/mob.rb"

RSpec.describe "Mob generation methods" do
    it "Should respond to race picker" do
        mob = Mob.new
        expect(mob).to respond_to :raceGen
    end

    it "Should respond to job picker" do
        mob = Mob.new
        expect(mob).to respond_to :jobGen
    end

    it "Should respond to name generator" do
        mob = Mob.new
        expect(mob).to respond_to :nameGen
    end
end