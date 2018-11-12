class Pokemon
  
 attr_accessor :id, :name, :type, :db, :hp

  def initialize(keywords)
    
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
  
  def self.find(num, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", [num])
    new_pokemon = self.new(pokemon)
    new_pokemon.id = pokemon[0][0]
    new_pokemon.name = pokemon[0][1]
    new_pokemon.type = pokemon[0][2]
    new_pokemon.hp = pokemon[0][3]
    return new_pokemon
  end

  def alter_hp(new_hp)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, id)
  end

  def self.all(db)
    pokemon = db.execute("SELECT * FROM posts")
    pokemon.map {|pokemon_info| Pokemon.new(pokemon_info, db) }
  end

  def self.where(type, db)
    sql = <<-SQL
    SELECT * FROM pokemon WHERE type = ?
    SQL
    pokemon = db.execute(sql, type)
    pokemon.map {|pokemon_info| Pokemon.new(pokemon_info, db)}
  end

 def destroy(db)
   db.execute("DELETE FROM pokemon WHERE id = ?", self.id)
 end
end