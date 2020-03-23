#require_relative "../config/environment.rb"

class Pokemon
  #responsible for removing, adding, saving, or changing about each pokemon
  attr_accessor :name, :type, :db, :hp
  attr_reader :id

  def initialize(id:, name:, type:, hp:, db:)
    @db = db
    @id = id
    @name = name
    @type = type
    @hp = hp
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
          FROM pokemons
          WHERE id = ?
          LIMIT 1
        SQL

        pokemon = db.execute(sql, id)
        id = pokemon[0]
        name = pokemon[1]
        type = pokemon[2]
        hp = pokemon[3]
        db = pokemon[4]
        Pokemon.new(id,name,type,hp,db)
    end

  def self.create_table
    #below is a HEREDOC
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS pokemons (
      id INTEGER PRIMARY KEY,
      name TEXT,
      type TEXT
      )
      SQL

      DB[:conn].execute(sql)  #execute SQL statement on database table
  end

  def self.drop_table
      sql= <<-SQL
      DROP TABLE students
      SQL
      DB[:conn].execute(sql) #execute SQL statement on database table
  end

  def self.create(name, type)
      pokemon = Pokemon.new(name, type)
      pokemon.save
      pokemon
  end

  def update
      sql = "UPDATE students SET name = ?, type = ? WHERE id = ?"
      DB[:conn].execute(sql, self.name, self.type, self.id)
  end

end
