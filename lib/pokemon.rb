class Pokemon
    attr_accessor :id, :name, :type, :db
    
    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.new_from_db(record, db)
        id = record[0]
        name = record[1]
        type = record[2]
        pokemon = self.new(id: id, name: name, type: type, db: db)
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT * FROM pokemon
            WHERE id = ?
            LIMIT 1
        SQL
        db.execute(sql, id).collect {|record| self.new_from_db(record, db)}.first
    end
end
