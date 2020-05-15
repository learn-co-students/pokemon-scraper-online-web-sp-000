class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize (id:, name:, type:, db:)
    @id = id 
    @name = name 
    @type = type  
    @db = db  
  end 

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end 

  def self.find(id_number, db)
    single_pokemon = db.execute("SELECT * FROM pokemon where id = ?", id_number).flatten
    Pokemon.new(id: single_pokemon[0], name: single_pokemon[1], type: single_pokemon[2], db: db)
  end 
end
