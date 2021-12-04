require_relative '../genre'
require_relative '../item'

describe Genre do
  before :each do
    @genre = Genre.new('Gospel')
  end

  describe '#add_item method' do
    it 'should add an item' do
      item = Item.new('20/02/1990')
      @genre.add_item(item)
      expect(@genre.items).to include(item)
    end
  end
end
