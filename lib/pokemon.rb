class Pokemon

    attr_accessor :id, :name, :type, :db

    # Remember, you can access your database connection anywhere in this class
    #  with DB[:conn]
  
    def initialize(attributes)
  
        attributes.each {|key, value| self.send(("#{key}="), value)}
  
    end

    def self.save(name, type, db)

    sql = <<-SQL
          INSERT INTO pokemon (name, type)
          VALUES (?, ?)
    SQL
        #binding.pry
    db.execute(sql, name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    
    end

    def update
        sql = "UPDATE pokemon SET name = ?, ytype = ? WHERE id = ?"
        @db.execute(sql, self.name, self.type, self.id)
    end

    def self.find(id, db)

    sql = <<-SQL
        SELECT *
        FROM pokemon
        WHERE id = ?
        LIMIT 1
      SQL
   
      db.execute(sql, id).map do |row|
        self.new_from_db(row, db)
        #puts self
      end.first
    end

    def self.new_from_db(row, db)
        # create a new Student object given a row from the

        new_pokemon = self.new(id: row[0], name: row[1], type: row[2], db: db)  # self.new is the same as running Song.new
        new_pokemon
      end

    #@db.execute(line)
end
