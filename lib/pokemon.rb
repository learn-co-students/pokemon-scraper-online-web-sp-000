require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(attributes)
    attributes.each do |attribute,value|
      self.send("#{attribute}=",value)
    end
  end

  def self.save(name,type,db)
    attributes = {
      :name => name,
      :type => type,
      :db => db
    }
    pokemon = self.new(attributes)

    sql = <<-SQL
      INSERT INTO pokemon (name,type)
      VALUES (?,?)
    SQL
    db.execute(sql, pokemon.name, pokemon.type)
  end

  def self.find(id,db)
    attributes = {:id=>id, :db=>db}
    pokemon = self.new(attributes)

    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id =?
    SQL

    row = db.execute(sql, pokemon.id)[0]

    new_attributes = {id: row[0], name: row[1], type: row[2]}
    new_pokemon = self.new(new_attributes)
    new_pokemon

  end

end
