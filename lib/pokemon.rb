class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(name:, type:, db:, id:nil)
        @name = name
        @type = type
        @db = db
        @id = id
    end

    def self.save(name, type, db)
        sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
        SQL

        db.execute(sql, name, type)
        @@id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(num, db)
        sql = <<-SQL
        SELECT *
        FROM pokemon
        WHERE
        pokemon.id = ?
        SQL

        rows = db.execute(sql, num)
        rows.map do |row|
            id = row[0]
            name = row[1]
            type = row[2]
            self.new(name: name, type: type, db: db, id: num)
            # binding.pry
        end.first
        
    end
end
