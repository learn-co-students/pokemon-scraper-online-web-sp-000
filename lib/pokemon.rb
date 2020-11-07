class Pokemon

    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        id = db.execute("SELECT COUNT(*) FROM pokemon")

        sql = "INSERT INTO pokemon(id, name, type) VALUES(#{id[0][0] + 1}, '#{name}', '#{type}')"

        db.execute(sql)

        db.execute("SELECT last_insert_rowid() FROM pokemon")
    end

    def self.find(id, db)
        pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = #{id};")
        
        id = pokemon_array[0][0]
        name = pokemon_array[0][1]
        type = pokemon_array[0][2]
        
        Pokemon.new(id: id, name: name, type: type, db: db)

    end

end
