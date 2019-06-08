require 'pry'

class Pokemon
    attr_accessor :name, :type, :id, :db, :hp

def initialize(id:nil,name:,type:, hp:nil, db:)
    @name = name
    @type = type
    @id = id
    @db = db
    @hp = hp
end

def self.save(name,type,db,hp)
      sql = <<-SQL
        INSERT INTO pokemon (name, type, hp)
        VALUES (?, ?, ?)
      SQL
      db.execute(sql, name, type, hp)
      @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
end

def alter_hp(hp)
  sql = "UPDATE pokemon SET hp = ? WHERE id = ?"
  @db.execute(spl,hp)
end

def self.find(id, db)
  sql = "SELECT * FROM pokemon WHERE id = ?"
  result = db.execute(sql, id)[0]
  Pokemon.new(id: id,name: result[1],type: result[2], db:db)
end

  def update
    sql = "UPDATE pokemon SET name = ?, type = ? WHERE id = ?"
    @db.execute(sql, self.name, self.type, self.id)
  end

end
