require_relative 'item'

class Book < Item
  def initialize(publish_date, publisher, cover_state)
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
    if super || @cover_state == 'bad'
      true
    else
      false
    end
  end
end
