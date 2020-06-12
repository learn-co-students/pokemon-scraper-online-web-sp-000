class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
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
      SELECT name, type from pokemon WHERE id = ?
    SQL
    result = db.execute(sql, id)[0]
    hash = {}
    hash[:id] = id
    hash[:name] = result[0]
    hash[:type] = result[1]
    Pokemon.new(hash)
  end

end
