class Pokemon

attr_accessor :name, :type, :db, :id

def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
end

def self.save(name, type, data)
    data.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    name = pokemon[1]
    type = pokemon[2]
    pokemon_init = Pokemon.new(id: id, name: name, type: type, db: db)

end
end