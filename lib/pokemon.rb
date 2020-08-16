require 'pry'
class Pokemon
    attr_accessor :id, :name, :type, :db 
    @@all = []

    def initialize(name:, type:, id:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
        @@all << self
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        id = pokemon[0]
        name = pokemon[1]
        type = pokemon[2]
        Pokemon.new(name: pokemon[1], type: pokemon[2], id:pokemon[0],db: db)

    end





end
