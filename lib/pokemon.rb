class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id: nil, name:, type:, db:)
        @id = id 
        @name = name
        @type = type
        @db = db
    end 

    def self.new_from_database(row, db)
        new_pokemon = self.new(id: row[0], name: row[1], type: row[2], db: db)
    end 

    def self.save(name, type, db)
        sql = <<-SQL
        INSERT INTO pokemon 
        (name, type) 
        VALUES (?, ?)
        SQL

        db.execute(sql, name, type)

        #extract the ID & set it equal to the instance's ID attribute.
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end 

    def self.find(id, db)
        sql = <<-SQL
        SELECT * FROM pokemon 
        WHERE id = ? 
        LIMIT 1
        SQL

        db.execute(sql, id).collect do |row|
            self.new_from_database(row, db)
        end.first
    end 

end