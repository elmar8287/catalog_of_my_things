require_relative '../label'
require_relative '../book'

describe Label do
  before :each do
    @label = Label.new('Label', 'red')
    @book = Book.new('2010/02/02', 'ProfPress', 'bad')
  end

  describe '#new' do
    it 'takes one parameter and returns a Lable object' do
      expect(@label).to be_an_instance_of(Label)
    end
  end

  describe '#add_book' do
    it 'check newly added item' do
      @label.add_item(@book)
      expect(@label.items).to include(@book)
    end
  end
end
