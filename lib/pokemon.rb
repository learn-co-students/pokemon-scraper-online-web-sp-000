class Pokemon
  
  attr_accessor :id, :name, :type, :db 
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) Values (?, ?)" , name, type)
  end
  
  def self.find(id, db)
    sql = <<-SQL
    SELECT *
    FROM pokemon
    WHERE id = ?
    SQL
    
    pokemon = db.execute(sql, id)[0]
    Pokemon.new({id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db})
  end
  
  
  
end
