class Item
  attr_accessor :id, :genre, :author, :label, :publish_date, :archived
  def initialize(publish_date)
    @id = Random.rand(1..100)
    @genre = nil
    @author = nil
    @label = nil
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archive
    @archived = true
  end

  private

  def can_be_archived?
    Date.today - @publish_date > 10
  end
end
