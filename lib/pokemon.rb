require 'pry'
class Pokemon
    attr_accessor :name, :type
    attr_reader :id, :db

    def initialize(id: , name: , type: , db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    #def self.create(name:, type:, db:)
     #   pokemon = Pokemon.new(name, type, db)
      #  pokemon.save
       # pokemon
    #end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
        #sql = <<-SQL
        #INSERT INTO pokemon (name, type)
        #VALUES (?, ?), name, type

        #SQL

        #db.execute(sql)
        #@id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.new_from_db(row)
        id = row[0]
        name = row[1]
        type = row[2]
        db = row[3]
        self.new(id, name, type, db)
        #self.new(row[0], row[1], row[2])
      end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        result = db.execute(sql, id)[0]
        binding.pry
        Pokemon.new(id: id, name: result[1], type: result[2], db: db)
    end
end

        #db.execute("SELECT * FROM pokemon WHERE id = ?)
        #self.new(id: default, name: default, type: default, db: default)
