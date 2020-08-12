class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db # db == DB[:conn]
    end

    def self.save(name, type, db)
        sql = <<-SQL
          INSERT INTO pokemon (name, type)
          VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        # find pokemon by id
        # return a new pokemon object
        sql = <<-SQL
          SELECT * 
          FROM pokemon
          WHERE id = ?
        SQL
        found_pokemon = db.execute(sql, id).flatten # or [0]
        Pokemon.new(id: found_pokemon[0], name: found_pokemon[1], type: found_pokemon[2], db: db)
        # db.execute(sql, id).map do |poke_array| # poke_array == [1, "Pikachu", "electric"]
        #     Pokemon.new(id: poke_array[0], name: poke_array[1], type: poke_array[2], db: db)
        #     # ==> MAP returns array [[#<Pokemon:xxx]]
        # end
    end
end
