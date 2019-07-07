class Pokemon
  attr_accessor :name, :type, :hp, :db, :id
  
  def initialize(name:, type:, hp: 60, db:, id: nil)
    @name = name
    @type = type
    @hp = hp
    @db = db
    @id = id
  end
  
  def self.save(name, type, db)
    # pokemon = Pokemon.new(name: name, type: type, db: db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
    # pokemon.id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  def self.find(id, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?", id).first
    Pokemon.new(name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db, id: pokemon_info[0])
  end
  
  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
    self.hp = new_hp
  end
  
end
