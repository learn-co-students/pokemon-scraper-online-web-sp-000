# class Pokemon
  
#   attr_accessor :name, :type, :db, :id, :hp

#   def initialize(keywords)
  
#   end
  
#   def self.save(name, type, db)
#     db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
#   end
  
#   def self.find(num, db)
#     pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", [num])
#     new_pokemon = self.new(pokemon)
#     new_pokemon.id = pokemon[0][0]
#     new_pokemon.name = pokemon[0][1]
#     new_pokemon.type = pokemon[0][2]
#     new_pokemon.hp = pokemon[0][3]
#     return new_pokemon
#   end
  
# def alter_hp(hp, db)
#     statement = db.prepare("UPDATE pokemon SET hp=? WHERE id=?")
#     statement.execute(hp,self.id)
#   end
  
  
  
  
  
  
  
# end

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
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?,?)", [name, type])
  end
  
  def self.find(id, db)
    pokemon=db.execute("SELECT * FROM Pokemon WHERE id=?",[id]).flatten
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], hp: pokemon[3], db: db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE Pokemon SET hp = ? WHERE id = ?", new_hp, @id)
  end
  
end
  
