class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(data)
    @id = data[:id] 
    @name = data[:name] 
    @type = data[:type]
    @db = data[:db] 
  end 
  
  def self.save(name, type, db) 
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
  
    name_sanitize_array = /[a-zA-Z\s]*/.match(name)
    type_sanitize_array = /[a-zA-Z\s]*/.match(type)

    name = name_sanitize_array[0]
    type = type_sanitize_array[0]
    db.execute(sql, name, type)

  end
  
  def self.find(id, db)
    
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ?
    SQL
    row = db.execute(sql, id)
    data = row.map{|x|
      {
        :id => x[0],
        :name => x[1],
        :type => x[2],
        :db => db
      }
    }.first
    out = Pokemon.new(data)
    return out
  end
end
