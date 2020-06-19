require 'pry'
class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id
    def initialize(id:nil, name:, type: , db:)
        # binding.pry
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        a = Pokemon.new(name: name, type: type, db: db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", a.name, a.type)
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT *
            FROM pokemon
            WHERE id = ?
        SQL
        row = db.execute(sql, id)[0]
        Pokemon.new(
            id: row[0],
            name: row[1],
            type: row[2],
            db: db
        )
        # binding.pry
    end
end
