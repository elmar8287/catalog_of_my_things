require_relative '../book'

describe Book do
  before do
    @book1 = Book.new('publisher1', 'bad', Date.new(2000, 1, 1))
  end
  # able to be archived
  it 'should be able to be archived' do
    expect(@book1.send(:can_be_archived?)).to eq(true)
  end

  # instanse of
  it 'should be an instance of Book' do
    expect(@book1).to be_an_instance_of(Book)
  end
  # kind of
  it 'should be a kind of Item' do
    expect(@book1).to be_a_kind_of(Item)
  end

  # respond_to
  it 'should respond to publisher' do
    expect(@book1).to respond_to(:publisher)
  end
end
