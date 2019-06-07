require 'pry'

class Pokemon
    attr_accessor :name, :type, :id, :db

def initialize(id:nil,name:,type:, db:)
    @name = name
    @type = type
    @id = id
    @db = db
end

def self.save(name, type, db)
      sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
      SQL
      db.execute(sql, name, type)
      @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
end

  def update
    sql = "UPDATE pokemon SET name = ?, type = ? WHERE id = ?"
    @db.execute(sql, self.name, self.type, self.id)
  end

  def self.find(id, db)
    @id = id
    sql = "SELECT * FROM pokemon WHERE id = ?"
    result = db.execute(sql, id)[0]
    binding.pry
    Pokemon.save(result[1], result[2], db)
  end

end
