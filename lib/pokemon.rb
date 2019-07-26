require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id: nil, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    poke = self.new(name: name, type: type, db: db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
    poke.db.execute(sql, poke.name, poke.type)
    poke.id = poke.db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

  def self.find(id, db)
    sql = "ALTER TABLE pokemon ADD COLUMN hp INTEGER"
    db.execute(sql)
    sql2 = "UPDATE pokemon SET hp = 60 WHERE id = ?"
    db.execute(sql2, id)
    sql3 = "SELECT * FROM pokemon WHERE id = ?"
    poke_row = db.execute(sql3, id)
    self.new(id: id, name: poke_row[0][1], type: poke_row[0][2], db: db, hp: poke_row[0][3])
  end

  # def alter_hp(hp, db)
  #   sql = "UPDATE pokemon SET hp = ? WHERE name = ?"
  #   db.execute(sql, id, self.name)
  # end

end
