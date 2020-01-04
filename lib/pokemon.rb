require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id: nil, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    # pokemon = self.new(name: name, type: type, db: db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) VALUES (? , ?)
      SQL

    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ?
      SQL

    db.execute(sql, id).collect do |pokemon|
      Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
    end.first
  end

end
