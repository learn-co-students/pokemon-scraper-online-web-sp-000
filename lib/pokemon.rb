class Pokemon
  
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.find(id, db)
    #as it's one line, no need to write sql = HDOCs for excecution
    pokemon_from_db = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
    Pokemon.new(id: pokemon_from_db[0], name: pokemon_from_db[1], type: pokemon_from_db[2], db: db)
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES(?, ?);", name, type )
  end

  
  
end
