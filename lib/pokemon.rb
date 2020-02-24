class Pokemon
  attr_accessor  :id, :name, :type, :db


  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save
      # if self.id
      #   sql = <<-SQL
      #   UPDATE pokemon SET name = ?, type = ?
      #   WHERE id = ?
      #   SQL
      #   DB[:conn].execute(sql, self.name, self.type, self.id)
      # else
        sql = <<-SQL
        INSERT INTO pokemon ("name", "type")
        VALUES (?,?)
        SQL
        DB[:conn].execute(sql, self.name, self.type)
       @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

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
