require_relative '../lib/book'

describe Book do
  context 'Testing the class books catalog' do
    before :each do
      @book = Book.new( "science","Brenda","na","unknown","09-09-2001","phouse","good") 
    end

    it '@book should be an instance of the class Book' do
      expect(@book).to be_instance_of Book
    end

    it "The album1's genre should be Alternative" do
      expect(@book.label).to eq('unknown')
    end

    it "The album1's author should be Beck" do
      expect(@book.author).to eq('Brenda')
    end

    it 'The method can_be_archived? should be available for the instance @album1' do
      expect(@book).to respond_to(:can_be_archived?)
    end
  end
end
