class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(name:, type:, db:nil, id:nil)
    self.name = name
    self.type = type
    self.id = id
    self.db = db
  end

  def self.save(name, type, db)
    character = self.new(name:name, type:type, db:db)
    sql = <<-SQL
      INSERT INTO pokemon
      (name, type)
      VALUES (?, ?)
      SQL
    db.execute(sql, character.name, character.type)
    character.id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end


  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon
      WHERE id = ?
    SQL
    row = db.execute(sql, id)
    self.new(id:row[0][0], name:row[0][1], type:row[0][2])
  end
end
