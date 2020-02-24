require_relative "../bin/environment.rb"

class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id 
  
  def initialize(id=nil, name, type, db)
    @id = id 
    @name = name 
    @type = type
    @db = db 
  end 

  def self.save 
    sql = <<-SQL 
    INSERT INTO pokemon (name, type, db) 
    VALUES (?, ?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.type, self.db)
    @id = result.DB[:conn].execute("SELECT last_inserted_rowid() FROM pokemon")[0][0]
  end 
  
  def self.find(id)
    sql = <<-SQL
    SELECT * FROM pokemon WHERE id = ? 
    SQL
    row = DB[:conn].execute(sql, id)
    new_pokemon = Pokemon.new(row[0], row[1], row[2], row[3])
    new_pokemon 
  end 
end
