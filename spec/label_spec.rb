require_relative '../lib/label'

describe Label do
  context 'Testing the class Author' do
    before :each do
      @label = Label.new('programming', 'blue')
    end

    it '@label should be an instance of the class label' do
      expect(@label).to be_instance_of Label
    end

    it "The author1's first name should be programming do"
      expect(@label.title).to eq('programming')
    end

    it 'the label color should be blue' do
      expect(@label.color).to eq('blue')
    end

    it 'The method add_item should be available for the instance label' do
      expect(@label).to respond_to(:add_item)
    end
  end
end
