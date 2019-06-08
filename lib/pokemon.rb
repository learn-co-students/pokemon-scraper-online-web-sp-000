require 'pry'

class Pokemon
    attr_accessor :name, :type, :id, :db, :hp

def initialize(id:nil,name:,type:,hp:60, db:)
    @name = name
    @type = type
    @id = id
    @db = db
    @hp = hp
end

def self.save(name,type,db)
      sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
      db.execute(sql, name, type)
      #@id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
end

def alter_hp(hp,db)
  sql = "UPDATE pokemon SET hp = ? WHERE id = ?"
  db.execute(sql,hp,self.id)
end

def self.find(id, db)
  sql = "SELECT * FROM pokemon WHERE id = ?"
  result = db.execute(sql, id)[0]
  Pokemon.new(id: id,name: result[1],type: result[2], db:db, hp:result[3])
end

  def update
    sql = "UPDATE pokemon SET name = ?, type = ? WHERE id = ?"
    @db.execute(sql, self.name, self.type, self.id)
  end

end
