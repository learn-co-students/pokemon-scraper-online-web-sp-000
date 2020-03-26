class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db

  def initialize(id: nil, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
        INSERT INTO pokemon (name, type) VALUES (?, ?)
    SQL

    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
        SELECT * FROM pokemon
        WHERE pokemon.id = ?
        LIMIT 1
    SQL

    row  = db.execute(sql, id)

    Pokemon.new(id: row[0][0], name: row[0][1], type: row[0][2], db: db)
  end

end
