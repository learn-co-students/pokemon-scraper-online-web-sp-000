require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []
  
  def initialize(id:, name:, type:, db:)
   @id = id
   @name = name
   @type = type 
   @db = db
 #  @hp = hp
  end
  
  
  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES ( ?, ?)",name, type) 
  end
  
  def self.find(id, db)
    id = db.execute("SELECT id FROM pokemon WHERE id = ?",id)
    name = db.execute("SELECT name FROM pokemon WHERE id = ?",id)
    type = db.execute("SELECT type FROM pokemon WHERE id = ?",id)
  #  hp =  db.execute("SELECT hp FROM pokemon WHERE id = ?",id)
    Pokemon.new(id: id[0][0], name: name[0][0], type: type[0][0], db: db)
  end
  
 # def alter_hp(hp, db) 
 #   db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
 #   #binding.pry
 #   #db.execute("SELECT hp FROM pokemon WHERE id = ?", self.id)
 # end
  
end

