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
    
    db.execute(sql, poke.name, poke.type)
    poke.id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end 
  
  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon 
      WHERE id = ?
      LIMIT 1
    SQL
    
    row = db.execute(sql, id)[0] 
    pokemon = Pokemon.new(id: row[0], name: row[1], type: row[2], db: db)
  end 
  
end 
