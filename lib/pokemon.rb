class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(name, type, id, db)


    @name = name
    @type = type
    @id = id
    @db = db

  end

  def self.save(name, type, id=nil)
    if @id
      #update
    else
      sql = <<-SQL
      INSERT INTO pokemon(name, type) VALUES(?,?);
      SQL

      @db.execute(sql, self.name, self.type)
    end

  end

  def self.find(id)
    sql = "SELECT * FROM pokemon WHERE id = ?;"
    row = DB[:conn].execute(sql, id)[0]
    self.new(row[1])
  end

end
