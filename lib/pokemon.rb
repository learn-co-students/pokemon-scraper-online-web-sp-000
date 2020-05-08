class Pokemon

    attr_accessor :name, :type
    attr_reader :id, :db

    def initialize(name:, type:, db:, id: nil)
        @name = name
        @type = type
        @id = id
        @db = db
    end

    def self.save(name, type, db)
        new_pokemon = Pokemon.new(name: name, type: type, db: db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
        SQL
        db.execute(sql,"#{name}","#{type}")
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT * FROM pokemon WHERE id = ?
        SQL
        new_pokemon = db.execute(sql,"#{id}".to_i).first
        Pokemon.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], db: db)
    end

end
