class Pokemon
  
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize (id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end
  
  def self.save (name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, pokemon_type)
      VALUES (?, ?)
    SQL
    
    db.execute(sql, name, type)
    
  end
  
  def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
      LIMIT 1
    SQL
    
    db.execute(sql, id).map do |row|
      Pokemon.new(id: row[0], name: row[1], type: row[2], hp: row[3], db: db)
    end.first
  end
  
  def alter_hp (new_hp, db)
    sql = <<-SQL
      UPDATE pokemon
      SET hp = ?
      WHERE id = ?
    SQL
    
    db.execute(sql, new_hp, @id)
  end
end
