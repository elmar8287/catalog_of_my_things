require_relative '../music_album'
require_relative '../item'

describe MusicAlbum do
  describe '#can_be_archived' do
    context 'The interval between publish_date up to now  is over 10 years and on spotify' do
      it 'should return true' do
        @item = MusicAlbum.new('1929-02-20', true)
        @item.move_to_archive
        expect(@item.archived).to be(true)
      end
    end

    context 'The interval between publish_date up to now  is over 10 years and not on spotify' do
      it 'should return false' do
        @item = MusicAlbum.new('1929-02-20', false)
        @item.move_to_archive
        expect(@item.archived).to be(false)
      end
    end

    context 'The interval between publish_date up to now  is less that 10 years and on spotify' do
      it 'should return false' do
        @item = MusicAlbum.new('2020-02-20', true)
        @item.move_to_archive
        expect(@item.archived).to be(false)
      end
    end

    context 'The interval between publish_date up to now  is less than 10 years and not on spotify' do
      it 'should return false' do
        @item = MusicAlbum.new('2020-02-20', false)
        @item.move_to_archive
        expect(@item.archived).to be(false)
      end
    end
  end
end
