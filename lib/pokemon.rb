require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp 

  
  def initialize(hp: nil, id:, name:, type:, db:)
    @id = id 
    @name = name 
    @type = type
    @hp = hp 
    @db = db 
  end 
  
  def self.save(name, type, db) 
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
    db.execute(sql, name, type)
  end 
  
  def self.find(id, db) 
    sql = "SELECT * FROM pokemon WHERE id = ?"
   new_pokemon = db.execute(sql,id).flatten
   add = Pokemon.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], db: db, hp: 60)
   #binding.pry 
  end 
  
  def alter_hp(hp,id) 
    sql = "UPDATE pokemon SET hp = 59 WHERE id = 1";
  end 
 
  
end
