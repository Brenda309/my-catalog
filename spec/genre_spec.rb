require_relative '../lib/genre'

describe Genre do
  context 'Testing the class Genre' do
    before :each do
      @genre1 = Genre.new('Rock')
    end

    it '@genre1 should be an instance of the class Genre' do
      expect(@genre1).to be_instance_of Genre
    end

    it "The genre1's name should be Rock" do
      expect(@genre1.name).to eq('Rock')
    end

    it 'The method add_item should be available for the instance @genre1' do
      expect(@genre1).to respond_to(:add_item)
    end
  end
end
