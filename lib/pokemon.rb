class Pokemon
  attr_accessor :name, :type, :hp, :db
  attr_reader :id
  
  def initialize(id: nil, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
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
    sql = "SELECT * FROM pokemon WHERE id = ?"
    result = db.execute(sql, id)[0]
    self.new(id: result[0], name: result[1], type: result[2], hp: result[3], db: db)
  end
  
  def alter_hp(hp, db)
    sql = "UPDATE pokemon SET hp = ? WHERE id = ?"
    db.execute(sql, hp, self.id)
  end
  
end
