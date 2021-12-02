require 'date'

class Item
  attr_reader :archived, :items

  def initialize(publish_date, genre, author, source)
    @id = Random.rand(0..10_000)
    @publish_date = publish_date
    @genre = genre
    @author = author
    @source = source
    @archived = false
  end

  def genre=(genre)
    genre.items.push(self)
  end

  def author=(author)
    author.items.push(self)
  end

  def source(source)
    source.items.push(self) unless source.items.include?(self)
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def to_s
    "Publish date: #{@publish_date}, Archived: #{@archived}\n#{@label}"
  end

  def to_json(_args)
    {
      'id' => @id,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'source_id' => @source.id
    }
  end

  private

  def can_be_archived?
    Date.today.year - Date.parse(@publish_date).year > 10
  end
end
