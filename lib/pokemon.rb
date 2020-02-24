require_relative "../bin/environment.rb"

class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id 
  
  def initialize(id=nil, name, type=nil, db)
    @id = id 
    @name = name 
    @type = type
    @db = db 
  end 

  def save 
    sql = <<-SQL 
    INSERT INTO pokemon (name, type, db) 
    VALUES (?, ?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.type, self.db)
    @id = result.DB[:conn].execute("SELECT last_inserted_rowid() FROM pokemon")[0][0]
  end 
end
