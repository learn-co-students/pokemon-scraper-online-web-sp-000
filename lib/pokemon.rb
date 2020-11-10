class Pokemon
  attr_accessor :id, :name, :type, :db
  
  def initialize(row)
    @id = row[0]
    @name = row[1]
    @type = row[2]
    @db = row[3]
  end

  def self.save(name, type, db)
    @db = db
    @name = name
    @type = type

    sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES (?, ?)
    SQL
    
    @db.execute(sql, @name, @type)

    @id = @db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]   
  end

  def self.find(id, db)
    @db = db
    @id = id
    
    sql = <<-SQL
    SELECT *
    FROM pokemon
    WHERE id = ?
    LIMIT 1
    SQL
    
    row = @db.execute(sql, @id)[0]
    new_pokemon = self.new(row) 
  end
end
