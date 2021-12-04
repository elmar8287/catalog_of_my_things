require './item'

class Book < Item
  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_s
    "\n[BOOK ID #{@id}]\nPublisher: #{@publisher}, Cover state: #{@cover_state}\n#{super}\n"
  end

  def to_json(*args)
    super.merge({
                  JSON.create_id => self.class.name,
                  'publisher' => @publisher,
                  'cover_state' => @cover_state
                }).to_json(*args)
  end

  def self.json_create(object)
    book = new(Date.parse(object['publish_date']), object['publisher'], object['cover_state'])
    book.id = object['id']
    book
  end

  private

  def can_be_archived?
    super == true || @cover_state == 'bad'
  end
end
