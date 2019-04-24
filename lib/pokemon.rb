require 'pry'

class Pokemon
  attr_accessor :name, :type, :db, :hp
  attr_reader :id

  def initialize(id: nil, name:, type:, hp: nil, db:)
    @name = name
    @type = type
    @id = id
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL

    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
    SQL

    result = db.execute(sql, id)[0]

    id = result[0]
    name = result[1]
    type = result[2]
    hp = result[3]

    pokemon = Pokemon.new(id: id, name: name, type: type, hp: hp, db: db)
    pokemon
  end

  def alter_hp(hp, db)
    sql = "UPDATE pokemon SET hp = ? WHERE id = ?"
    db.execute(sql, hp, self.id)
  end
end
