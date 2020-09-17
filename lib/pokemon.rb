require 'pry'

class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        # row = db.execute("SELECT * FROM pokemon WHERE id=?", id).first
        # new_pk = self.new(row)
        # new_pk.id = row[0]
        # new_pk.name = row[1]
        # new_pk.type = row[2]
        # new_pk

        row = db.execute("SELECT * FROM pokemon WHERE id = ?", id).first
        Pokemon.new({id: row[0], name: row[1], type: row[2], db: db}) #Doesn't need to be a hash, but left as is for readability
    end

end
