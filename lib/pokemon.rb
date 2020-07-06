class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(pokedex)
    # @id = id
    # @name = name
    # @type = type
    # @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)

    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

  def self.find(num, db)
    pokedex = db.execute("SELECT * FROM pokemon WHERE id = ?", num)
    new_pokemon = self.new(pokedex)
    new_pokemon.id = pokedex[0][0]
    new_pokemon.name = pokedex[0][1]
    new_pokemon.type = pokedex[0][2]
    new_pokemon
  end

end
