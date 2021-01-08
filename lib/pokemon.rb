class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []
  
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end
  
  def self.save(name, type, db_connection)
    db_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
    
  def self.find (id, db_connection)
    poke_id = db_connection.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    name = poke_id[1]
    type = poke_id[2]
    
    new_poke = Pokemon.new(id: id, name: name, type: type, db: db_connection)
  end
  
  
end
