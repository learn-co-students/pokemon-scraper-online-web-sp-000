class Pokemon
  attr_accessor  :id, :name, :type, :db


  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
        sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?,?)
        SQL
        db.execute(sql, name, type)
       @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

    def self.find(id, db)
      sql = <<-SQL
      SELECT name, type FROM pokemon
      WHERE id = ?
      LIMIT 1
      SQL
      results =  db.execute(sql, id).flatten
      # binding.pry
      pokemon = Pokemon.new(id: id, name: results[0], type: results[1], db: db)
      pokemon
    end

  # if self.id
  #   sql = <<-SQL
  #   UPDATE pokemon SET name = ?, type = ?
  #   WHERE id = ?
  #   SQL
  #   DB[:conn].execute(sql, self.name, self.type, self.id)
  # else

  # def self.create_table
  #   sql = <<-SQL
  #     CREATE TABLE IF NOT EXISTS pokemon (
  #       id INTEGER PRIMARY KEY,
  #       name TEXT,
  #       type TEXT
  #     )
  #   SQL
  #   DB[:conn].execute(sql)
  # end



end
