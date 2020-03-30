#require_relative "../config/environment.rb"

class Pokemon
  #responsible for removing, adding, saving, or changing about each pokemon
  attr_accessor :name, :type, :db, :id
  #attr_reader :id
  @@all = []

  def initialize(id:, name:, type:, db:)
    #above uses keywords
    @db = db
    @id = id
    @name = name
    @type = type
    @@all << self
  end

  def self.save(name, type, db)
  #this method really persists the student instance copy to the database
          sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
          SQL

          db.execute(sql, name, type)
  end

  def self.find(id, db)
      # find the pokemon in the database given an id
      # return a new instance of the Pokemon class
        sql = <<-SQL
          SELECT *
          FROM pokemon
          WHERE id = ?
        SQL

        pokemon = db.execute(sql, id)
        new_pokemon_id = pokemon[0][0]
        new_pokemon_name = pokemon[0][1]
        new_pokemon_type = pokemon[0][2]
        new_pokemon = self.new(id: new_pokemon_id, name: new_pokemon_name, type: new_pokemon_type, db: db)
        return new_pokemon
    end

  def self.create_table
    #below is a HEREDOC
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS pokemon (
      id INTEGER PRIMARY KEY,
      name TEXT,
      type TEXT
      )
      SQL

      DB[:conn].execute(sql)  #execute SQL statement on database table
  end

  def self.drop_table
      sql= <<-SQL
      DROP TABLE pokemon
      SQL
      DB[:conn].execute(sql) #execute SQL statement on database table
  end

  def self.create(name, type)
      pokemon = Pokemon.new(id, name, type)
      pokemon.save
      pokemon
  end

  def update
      sql = "UPDATE pokemon SET name = ?, type = ? WHERE id = ?"
      DB[:conn].execute(sql, self.name, self.type, self.id)
  end

end
