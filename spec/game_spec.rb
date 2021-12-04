require_relative '../game'

describe Game do
  before :each do
    @game = Game.new '2012/02/02', true, '2018/08/08'
  end

  describe '#new' do
    it 'takes three parameters and returns a Game object' do
      expect(@game).to be_an_instance_of(Game)
    end
  end

  describe '#archived' do
    it 'returns false (by default set as false)' do
      expect(@game.archived).to eql false
    end
  end

  describe '#can_be_archived?' do
    it 'can be archived if published over 10 years ago and last played over 2 years ago' do
      @game = Game.new('01/01/1990', 'yes', '10/10/2010')
      @game.move_to_archive
      expect(@game.archived).to eql true
    end

    it 'cannot be archived if published over 10 years ago and last played less than 2 years ago' do
      @game = Game.new('01/01/1990', 'yes', '10/10/2020')
      @game.move_to_archive
      expect(@game.archived).to eql false
    end

    it 'cannot be archived if published less than 10 years ago and last played less than 2 years ago' do
      @game = Game.new('01/01/2015', 'yes', '10/10/2020')
      @game.move_to_archive
      expect(@game.archived).to eql false
    end

    it 'cannot be archived if published less than 10 years ago and last played over 2 years ago' do
      @game = Game.new('01/01/2011', 'yes', '10/10/2015')
      @game.move_to_archive
      expect(@game.archived).to eql false
    end
  end
end
