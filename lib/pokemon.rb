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

    def self.find_all
    end

    def self.find(id, db)
        db.execute("SELECT * FROM pokemon WHERE id = ? LIMIT 1")
        #self.new(id: default, name: default, type: default, db: default)
    end
end
