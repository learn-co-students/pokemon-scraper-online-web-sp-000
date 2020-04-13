class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    save = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
      SQL
    
    db.execute(save, name, type)
  end
    
  def self.find(id, db)
    find = <<-SQL
        SELECT * FROM pokemon
        WHERE id = ?
      SQL
    
    pokemon_array = db.execute(find, id)[0]
    pokemon_oi = Pokemon.new(id: pokemon_array[0], name: pokemon_array[1], type: pokemon_array[2], db: db)
    pokemon_oi
  end
  
end
