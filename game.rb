require_relative 'item'

class Game < Item
  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_s
    "\n[GAME ID #{@id}]\nMultiplayer: #{@multiplayer}, Last played at: #{@last_played_at}\n#{super}\n"
  end

  def to_json(*args)
    super.merge({
                  JSON.create_id => self.class.name,
                  'publish_date' => @publish_date,
                  'multiplayer' => @multiplayer,
                  'last_played_at' => @last_played_at
                }).to_json(*args)
  end

  def self.json_create(object)
    game = new(Date.parse(object['publish_date']), object['multiplayer'], Date.parse(object['last_played_at']))
    game.id = object['id']
    game
  end

  private

  def can_be_archived?
    super && (Date.today.year - Date.parse(@last_played_at).year) > 2
  end
end
