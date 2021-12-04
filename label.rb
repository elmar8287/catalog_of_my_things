class Label
  attr_reader :items
  attr_accessor :id

  def initialize(title, color)
    @id = Random.rand(0..10_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end

  def to_s
    "Label - Title: #{@title}, Color: #{@color}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'title' => @title,
      'color' => @color
    }.to_json(*args)
  end

  def self.json_create(object)
    label = new(object['title'], object['color'])
    label.id = object['id']
    label
  end
end
