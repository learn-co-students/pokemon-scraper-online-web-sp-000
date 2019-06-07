require 'pry'

class Pokemon
    attr_accessor :name, :type, :id, :db

def initialize(id:nil,name:,type:, db:)
    @name = name
    @type = type
    @id = id
    @db = db
    binding.pry
end

def self.save
    binding.pry
    if self.id
      self.update
    else
      sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
      SQL
      binding.pry
      @db.execute(sql, self.name, self.type)
      @id = @db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end
end

  def update
    binding.pry
    sql = "UPDATE pokemon SET name = ?, type = ? WHERE id = ?"
    @db.execute(sql, self.name, self.type, self.id)
  end

end
