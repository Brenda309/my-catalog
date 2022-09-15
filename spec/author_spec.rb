require_relative '../lib/author'

describe Author do
  context 'Testing the class Author' do
    before :each do
      @author1 = Author.new('John', 'Doe')
    end

    it '@author1 should be an instance of the class Author' do
      expect(@author1).to be_instance_of Author
    end

    it "The author1's first name should be John" do
      expect(@author1.first_name).to eq('John')
    end

    it "The author1's last name should be Doe" do
      expect(@author1.last_name).to eq('Doe')
    end

    it 'The method add_item should be available for the instance @author1' do
      expect(@author1).to respond_to(:add_item)
    end
  end
end
