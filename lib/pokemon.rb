require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(id:, name:, type:, db:)
    @id = id 
    @name = name 
    @type = type 
    @db = db
  end
  
  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end 
  
  def self.find(id_num, db)
    poke_array = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?",id_num)[0]
    self.new(id: poke_array[0], name: poke_array[1], type: poke_array[2], db: db)
  end 
  
end
