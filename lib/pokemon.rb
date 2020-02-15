require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon(name, type)
      VALUES (?, ?)
    SQL

    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
      Select * From pokemon
      Where id = ?
    SQL
    # binding.pry
    attributes = db.execute(sql, id).flatten
    pokemon = Pokemon.new(db)
    pokemon.id = attributes[0]
    pokemon.name = attributes[1]
    pokemon.type = attributes[2]
    pokemon
  end

end
