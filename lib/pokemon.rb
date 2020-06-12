class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
    @db = db
  end

  def self.save(name, type, db)
    binding.pry
    sql = <<-SQL
      INSERT INTO pokemon (name, type) 
      VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, name, type)
  end

  def self.find(id, db)
    sql = 
  end

end
