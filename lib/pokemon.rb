class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(id:, name:, type:, db:)
    @id = id 
    @name = name 
    @type = type
    @db = db
  end 
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end 
  
  def self.find(lookup_id, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = ?", [lookup_id]).first
    new_pokemon = self.new(id: poke[0], name: poke[1], type: poke[2], db: db)
    new_pokemon
  end 
  
end
