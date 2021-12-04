require_relative '../author'
require_relative '../book'

describe Author do
  before :each do
    @author = Author.new 'James', 'Cameron'
    @book = Book.new '2010/02/02', 'ProfPress', 'bad'
  end

  describe '#new' do
    it 'takes two parameter and returns an Author object' do
      expect(@author).to be_an_instance_of(Author)
    end
  end

  describe '#add_item' do
    it 'check newly added item' do
      @author.add_item @book
      expect(@author.items).to include(@book)
    end
  end
end
