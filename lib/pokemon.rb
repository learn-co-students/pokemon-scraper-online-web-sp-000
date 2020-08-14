require 'pry'

class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(id: nil, name: name, type: type, db: db)
    @id = id
    @name = name 
    @type = type 
    @db = db 
  end
  
  ###finish
  def self.save(name, type, db)
    pokemon = self.new(name: name, type: type, db: db)
    sql = <<-SQL 
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    
    DB[:conn].execute(sql, pokemon.name, pokemon.type)
    pokemon.id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    binding.pry
  end 
  
  def self.find(id)
    sql = <<-SQL
      SELECT * FROM pokemon 
      WHERE id = ? 
      LIMIT 1
    SQL
    row = DB[:conn].execute(sql, id)
    pokemon = Pokemon.new(row[0], row[1], row[2], row[3])
  end 
  
end
