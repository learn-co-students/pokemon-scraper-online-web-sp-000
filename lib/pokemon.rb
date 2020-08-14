class Pokemon 
  attr_accessor :name, :type, :db, :id 
  
  def initialize(id: nil, name: name, type: type, db: db)
    @id = id 
    @name = name 
    @type = type 
    @db = db 
  end 
  
  def self.save(name, type, db)
    poke = self.new(name: name, type: type, db: db)
    sql = <<-SQL 
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    
    DB[:conn].execute(sql, poke.name, poke.type)
    poke.id = @db[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end 
  
  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon 
      WHILE id = ?
      LIMIT 1
    SQL
    
    DB[:conn].execute(sql, id) 
  end 
  
end 
