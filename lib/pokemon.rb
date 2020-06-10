class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
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
    sql = "SELECT * FROM pokemon WHERE id = ?"
    
    db.execute(sql, id).map do |row|
      self.new(id: id, name: row[1], type: row[2], db: db)
    end.first
  end

end
