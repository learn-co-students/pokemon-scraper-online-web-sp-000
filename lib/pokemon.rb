class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL

    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon
      WHERE id = ?
    SQL

    row = db.execute(sql, id).flatten
    Pokemon.new(id: row[0], name: row[1], type: row[2], hp: row[3], db: db)
  end

  def alter_hp(hp, db)
    sql = <<-SQL
      UPDATE pokemon
      SET hp = ?
      WHERE id = ?
    SQL

    db.execute(sql, hp, self.id)
  end
end
