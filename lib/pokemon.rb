class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(id: nil, name: nil, type: nil, db: nil)
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
      LIMIT 1
    SQL
    found = db.execute(sql, id)[0]
    Pokemon.new(id: found[0], name: found[1], type: found[2])
  end
end
