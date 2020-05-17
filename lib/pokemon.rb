class Pokemon
  
  attr_accessor :name, :type, :db
  attr_reader :id
  
  def initialize(id:, name:, type:, db:)
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
    db.execute("SELECT * FROM pokemon WHERE id = ?", id).map do |row|
      self.new_from_db(row, db)
    end.first
  end
  
  def self.new_from_db(row, db)
    new_pokemon = self.new(id: row[0], name: row[1], type: row[2], db: db)
    new_pokemon
  end
  
end
