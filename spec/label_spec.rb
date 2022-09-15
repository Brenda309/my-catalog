require_relative '../lib/label'

describe Label do
  context 'Testing the class Author' do
    before :each do
      @label = Label.new('programming', 'blue')
    end

    it '@label should be an instance of the class Author' do
      expect(@label).to be_instance_of Label
    end

    it "The author1's first name should be John" do
      expect(@label.title).to eq('programming')
    end

    it "The author1's last name should be Doe" do
      expect(@label.color).to eq('blue')
    end

    it 'The method add_item should be available for the instance @author1' do
      expect(@label).to respond_to(:add_item)
    end
  end
end
