require_relative '../lib/game'

describe Game do
  context 'Testing the class Game' do
    before :each do
      @game1 = Game.new('RPG', 'John Doe', 'Nintendo', 'NA', '2000-08-23', '2022-09-10')
    end

    it '@game1 should be an instance of the class Game' do
      expect(@game1).to be_instance_of Game
    end

    it "The game1's source should be Nintendo" do
      expect(@game1.source).to eq('Nintendo')
    end

    it "The game1's last_played_at should be 2022-09-10" do
      expect(@game1.last_played_at).to eq('2022-09-10')
    end

    it 'The method can_be_archived? should be available for the instance @game1' do
      expect(@game1).to respond_to(:can_be_archived?)
    end
  end
end
