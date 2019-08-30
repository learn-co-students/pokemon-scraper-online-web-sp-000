class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(db)



    #@db = db

  end

  def self.save(name, type, db)

      #update

      sql = <<-SQL
      SELECT * FROM pokemon WHERE name = ? AND type = ?;
      SQL

      row = db.execute(sql, name, type)[0]
      pokemon = self.new(db)
      pokemon.id = row[0]
      pokemon.name = name
      pokemon.type = type
      pokemon




  end

  def self.find(id)
    sql = "SELECT * FROM pokemon WHERE id = ?;"
    row = DB[:conn].execute(sql, id)[0]
    self.new(row[1])
  end

end
