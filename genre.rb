class Genre
  attr_accessor :name, :id
  attr_reader :items

  def initialize(name)
    @id = Random.rand(1..10_000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end

  def to_s
    "Genre - Name: #{@name}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'name' => @name
    }.to_json(*args)
  end

  def self.json_create(object)
    genre = new(object['name'])
    genre.id = object['id']
    genre
  end
end
