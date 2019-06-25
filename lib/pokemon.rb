require 'pry'

class Pokemon
  attr_accessor :id, :type, :name, :db, :hp

  def initialize(id: nil, type:, name:, db:, hp: nil)
    @id = id
    @type = type
    @name = name
    @db = db 
    @hp = hp   
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) 
      VALUES (?, ?)
    SQL

    db.execute(sql, [name, type])
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon
      WHERE id = + "#{id}"
    SQL

    db_pokemon = db.execute(sql).flatten!
    self.new(id: db_pokemon[0], name: db_pokemon[1], type: db_pokemon[2], db: db, hp: db_pokemon[3])  
  end
end
