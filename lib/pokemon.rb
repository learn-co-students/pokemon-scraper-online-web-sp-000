
require 'pry'

class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(x)
    @id = x[:id]
    @name = x[:name]
    @type = x[:type]
    @db = x[:db]
  end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    #binding.pry
    pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
  end
end
