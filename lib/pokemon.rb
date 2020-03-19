class Pokemon
  require 'pry'
  attr_accessor :name, :type, :db, :id
  
def initialize(id: nil, name:, type:, db:)
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
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  def self.find(id_num, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
      LIMIT 1
    SQL
 
   info = db.execute(sql, id_num).flatten
      Pokemon.new(id: info[0],name: info[1],type: info[2], db: db)
    end
end
