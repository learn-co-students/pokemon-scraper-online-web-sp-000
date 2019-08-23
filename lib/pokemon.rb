class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def update
    sql = "UPDATE pokemon SET name = ?, type = ?, WHERE id = ?"
    db.execute(sql, self.name, self.type, self.id)
  end

  # def self.find(id, db)
  #   sql = <<-SQL
  #     SELECT *
  #     FROM pokemon
  #     WHERE id = ?
  #     LIMIT 1
  #   SQL
  #   pokemon = db.execute(sql,[id]).flatten
  #   Pokemon.new(id: id, name: pokemon[1], type: pokemon[2], db: db)
  # end
  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) VALUES (?, ?);
    SQL

    db.execute(sql, [name, type])

  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = (?);
    SQL
    pokemon = db.execute(sql, [id]).flatten
    Pokemon.new(id: id, name: pokemon[1], type: pokemon[2],db: db )
  end
end
