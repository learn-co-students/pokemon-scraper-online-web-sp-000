class Pokemon 
  attr_accessor :name, :type, :db, :id 
  
  def initialize(id: nil, name: name, type: type, db: db)
    @id = id 
    @name = name 
    @type = type 
    @db = db 
  end 
  
  def self.save(name, type, db)
    pokemon = self.new(name: name, type: type, db: db)
    sql = <<-SQL 
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    
    DB[:conn].execute(sql, pokemon.name, pokemon.type)
    DB[:conn].execute("SELECT last_insert_rowid() ")
    binding.pry
  end 
  
end 
