class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(name, type, id, db)


    @name = name
    @type = type
    @id = id
    @db = db

  end

  def self.save(name, type, db)
    if @id
      #update
    else
      sql = <<-SQL
      INSERT INTO pokemon(name, type) VALUES(?,?);
      SQL

      row = db.execute(sql, name, type)[0]
      self.new(row[1],row[2],row[0],db)


    end

  end

  def self.find(id)
    sql = "SELECT * FROM pokemon WHERE id = ?;"
    row = DB[:conn].execute(sql, id)[0]
    self.new(row[1])
  end

end
