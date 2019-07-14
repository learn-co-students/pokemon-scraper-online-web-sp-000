class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db
  
  def initialize(name:, type:, db:, id: nil)
    @name = name
    @type = type
    @db = db
    @id = id
  end
  
  def self.save(name,type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type, db) 
      VALUES (?, ?, ?)
    SQL

    DB[:db].execute(sql, self.name, self.type, self.db)
    @id = DB[:db].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  def self.find 
    
  en
  
end
