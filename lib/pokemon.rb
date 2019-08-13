require "pry"
class Pokemon
  attr_accessor :name, :type, :db, :id
  #attr_reader :id
  
  def initialize(id:, name:, type:, db:)
    @id = id 
    @name = name 
    @type = type 
    @db = db
  end
  
  def self.save(name, type, db)
      sql = <<-SQL
          INSERT INTO pokemon (name, type)
          VALUES (?, ?)
          SQL
      db.execute(sql, name, type)   
  end
  
  def self.find(id, db)
    result = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    new_pokemon = self.new(id: result[0], name: result[1], type: result[2], db: db)
    
  end
  
  
end
