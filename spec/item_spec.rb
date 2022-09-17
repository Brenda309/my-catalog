require_relative '../lib/item'

describe Item do
  context 'Testing the class Item' do
    before :each do
      @item1 = Item.new('Genre', 'Author', 'Source', 'Label', '1970-01-01')
    end

    it '@item1 should be an instance of the class Item' do
      expect(@item1).to be_instance_of Item
    end

    it "The item1's genre should be Genre" do
      expect(@item1.genre).to eq('Genre')
    end

    it "The item1's label should be Label" do
      expect(@item1.label).to eq('Label')
    end

    it 'The method can_be_archived? should be available for the instance @item1' do
      expect(@item1).to respond_to(:can_be_archived?)
    end

    it 'The method move_to_archive should be available for the instance @item1' do
      expect(@item1).to respond_to(:move_to_archive)
    end
  end
end
