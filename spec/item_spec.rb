require_relative '../item'
require_relative '../genre'
require_relative '../author'
require_relative '../label'

describe Item do
  before :each do
    @item = Item.new '2010/10/10'
  end

  describe '#can_be_archived?' do
    it 'not archived if item was published less than 10 years ago' do
      @item = Item.new '2020/10/10'
      @item.move_to_archive
      expect(@item.archived).to eql false
    end

    it 'archive if item was published more than 10 years ago' do
      @item.move_to_archive
      expect(@item.archived).to eql true
    end
  end

  describe '#genre' do
    it 'sets the genre' do
      @item.genre = Genre.new('Comedy')
      expect(@item.genre).to be_an_instance_of Genre
    end
  end

  describe '#author' do
    it 'sets the author' do
      @item.author = Author.new('Stephen', 'King')
      expect(@item.author).to be_an_instance_of Author
    end
  end

  describe '#label' do
    it 'sets the label' do
      @item.label = Label.new('Labell', 'Red')
      expect(@item.label).to be_an_instance_of Label
    end
  end
end
