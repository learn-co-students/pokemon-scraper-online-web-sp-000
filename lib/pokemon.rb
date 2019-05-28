class Pokemon

  attr_accessor :id, :name, :type, :hp, :db

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_parts = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    new_id = pokemon_parts[0]
    new_name = pokemon_parts[1]
    new_type = pokemon_parts[2]
    new_hp = pokemon_parts[3]
    new_pokemon = Pokemon.new(id: new_id, name: new_name, type: new_type, hp: new_hp, db: db)

  end

  def initialize(id:, name:, type:, hp: 60, db:)
    @id, @name, @type, @hp, @db = id, name, type, hp, db
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end
end
