require 'pry'
class Pokemon
  attr_accessor :name, :type, :id, :db
  def initialize(name:, type:, id:, db:)
    @name = name
    @type = type 
    @id = id 
    @db = db 
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end
  
  def self.find(id, db)
    sql = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
    # binding.pry 
    Pokemon.new(id: sql[0], name: sql[1], type: sql[2], db: db)
  end 
  
  

  
end

