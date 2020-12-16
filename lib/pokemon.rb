class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id
    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        pokemon = self.new(name: name, type: type, db: db)

        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        row = db.execute('SELECT * FROM pokemon WHERE id = ? LIMIT 1', id)[0]
        self.new(name: row[1], type: row[2], id: row[0], db: db)
    end
end
