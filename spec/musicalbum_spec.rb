require_relative '../lib/musicalbum'

describe MusicAlbum do
  context 'Testing the class Music Album' do
    before :each do
      @album1 = MusicAlbum.new('Alternative', 'Beck', 'Youtube', 'EMI', '2010-06-12')
    end

    it '@album1 should be an instance of the class MusicAlbum' do
      expect(@album1).to be_instance_of MusicAlbum
    end

    it "The album1's genre should be Alternative" do
      expect(@album1.genre).to eq('Alternative')
    end

    it "The album1's author should be Beck" do
      expect(@album1.author).to eq('Beck')
    end

    it 'The method can_be_archived? should be available for the instance @album1' do
      expect(@album1).to respond_to(:can_be_archived?)
    end
  end
end
