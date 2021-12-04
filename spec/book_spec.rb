require_relative '../book'

describe Book do
  before :each do
    @book = Book.new '2002/02/02', 'ProfPress', 'bad'
  end

  describe '#new' do
    it 'takes three parameters and returns a Book object' do
      expect(@book).to be_an_instance_of(Book)
    end
  end

  describe '#archived' do
    it 'returns false (by default set as false)' do
      expect(@book.archived).to eql false
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if parent\'s method returns true OR if cover_state equals to "bad"' do
      @book.move_to_archive
      expect(@book.archived).to eql true
    end
  end

  it 'can be archived when published over 10 years ago' do
    @book = Book.new('01/01/1995', 'ABC Publications', 'good')
    @book.move_to_archive
    expect(@book.archived).to eql true
  end

  it 'can be archived when cover state is bad' do
    @book = Book.new('10/12/2020', 'DEF Publications', 'bad')
    @book.move_to_archive
    expect(@book.archived).to eql true
  end

  it 'cannot be archived published less than 10 years ago and cover state is good' do
    @book = Book.new('01/01/2021', 'GHI Publications', 'good')
    @book.move_to_archive
    expect(@book.archived).to eql false
  end
end
