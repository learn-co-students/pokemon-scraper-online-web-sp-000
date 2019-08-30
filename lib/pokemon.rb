class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(db)


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
      INSERT INTO pokemon(name, type) VALUES(?,?,?);
      SQL

      DB[:conn].execute(sql, self.name, self.type, self.db)
    end

  end

  def self.find(id)
    sql = "SELECT * FROM pokemon WHERE id = ?;"
    row = DB[:conn].execute(sql, id)[0]
    self.new(row[1])
  end

end
