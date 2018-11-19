class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE pokemon.id = (?);", id).flatten
    pokemon = Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
    pokemon
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE pokemon.id = (?);", new_hp, self.id)
  end
end
