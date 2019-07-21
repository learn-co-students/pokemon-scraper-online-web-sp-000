class Pokemon

attr_accessor :id, :name, :type, :db


  def initialize(keywords)
    #  @id = id
    #  @name = name
    #  @type = type
    #  @db = db
   end

   def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)", name, type)
   end

  #  def self.find(id, db)
  #    sql = <<-SQL
  #       SELECT * FROM pokemon WHERE id = (?);
  #     SQL
  #     pokemon = db.execute(sql, [id]).flatten
  #     Pokemon.new(id:, name:, type:, db:)
  #   end
  def self.find(num, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", [num])
    new_pokemon = self.new(pokemon)
    new_pokemon.id = pokemon[0][0]
    new_pokemon.name = pokemon[0][1]
    new_pokemon.type = pokemon[0][2]
  #  new_pokemon.hp = pokemon[0][3]
    return new_pokemon
  end

end
