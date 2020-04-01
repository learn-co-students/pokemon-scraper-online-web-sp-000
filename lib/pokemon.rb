class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id: nil, name:, type:, db:)
    @id, @name, @type, @db = id, name, type, db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL

    db.execute(sql, name, type)
  end

  def self.new_from_db(row)
    self.new(id: row[0], name: row[1], type: row[2], db: row[3])
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      where id = ?
      LIMIT 1
    SQL

    db.execute(sql, id).map do |row|
      self.new_from_db(row)
    end.first
  end

end
