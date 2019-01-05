class Pokemon
  attr_accessor :id, :name, :type, :db
  
 def initialize(id = 'default', name = 'pikachu', type = 'electric', db)
    @id, @name, @type, @db = id, name, type, db
  end

  
  def self.save(name, type, db = 'default')
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end
  
  def self.find(id, db)
   find_pokemon = db.execute("SELECT id, name, type FROM pokemon WHERE id = ?", id).flatten
   new_pokemon = Pokemon.new(id = find_pokemon[0], name = find_pokemon[1], type = find_pokemon[2], db = db)
 end



end
