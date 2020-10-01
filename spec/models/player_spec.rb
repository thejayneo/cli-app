require_relative "../../model/player.rb"

RSpec.describe "Player generation" do
    it "Should respond to elf" do
        player = Player.new("tester")
        expect(player).to respond_to :elf
    end

    it "Should respond to human" do
        player = Player.new("tester")
        expect(player).to respond_to :human
    end

    it "Should respond to dwarf" do
        player = Player.new("tester")
        expect(player).to respond_to :dwarf
    end

    it "Should respond to mage" do
        player = Player.new("tester")
        expect(player).to respond_to :mage
    end

    it "Should respond to knight" do
        player = Player.new("tester")
        expect(player).to respond_to :knight
    end

    it "Should respond to rogue" do
        player = Player.new("tester")
        expect(player).to respond_to :rogue
    end

    it "Should respond to ranger" do
        player = Player.new("tester")
        expect(player).to respond_to :ranger
    end
end