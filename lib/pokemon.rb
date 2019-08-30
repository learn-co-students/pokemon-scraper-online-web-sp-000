class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(db)


    #@name = name
    #@type = type
    #@id = id
    @db = db

  end

  def self.save(name, type, db)

      #update

      sql = <<-SQL
      SELECT * FROM pokemon WHERE name = ?;
      SQL

      row = db.execute(sql, name)[0]
      #self.new(row)




  end

  def self.find(id)
    sql = "SELECT * FROM pokemon WHERE id = ?;"
    row = DB[:conn].execute(sql, id)[0]
    self.new(row[1])
  end

end
