class Pokemon
  attr_accessor :id, :name, :type, :db
  
  def initialize (id: nil, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name:, type:, db:)
    pokemon = Pokemon.new(id: nil, name:, type:, db:)
    sql = "INSERT INTO pokemon (name, type, db) VALUES (?, ?, ?)"
    DB[:conn].execute(sql, pokemon.name, pokemon.type, pokemon.db)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0]
  end
  
  def self.find(id)
    sql = "SELECT*FROM pokemon WHERE id = ?"
    result = DB[:conn].execute(sql, id)[0]
    Pokemon.new(result[0], result[1], result[2], self.db)
    
  end
  
  
end
