class Pokemon

    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(id = nil, hash)
        @id = id
        @name = hash[:name]
        @type = hash[:type]
        @db = hash[:db]
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)       
        SQL
        db.execute(sql, name, type)
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
        db.execute("SELECT * FROM pokemon")
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        result = db.execute(sql, id)[0]
        hash = {}
        hash[:name] = result[1]
        hash[:type] = result[2]
        Pokemon.new(result[0], hash)
    end
end
