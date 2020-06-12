require 'pry'

class Pokemon

  attr_reader :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end



  # def self.find(id, db)
  #   db.execute("SELECT id, name, type FROM pokemon WHERE id = ?", id).flatten
  # end
  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = (?);
    SQL
    pokemon = db.execute(sql, [id]).flatten    
    id = pokemon[0]
    name = pokemon[1]
    type = pokemon[2]
    hp = pokemon[3]

    new_pokemon = self.new(id: id, name: name, type: type, hp: hp, db: db)
    return new_pokemon
  end




  # it 'finds a pokemon from the database by their id number and returns a new Pokemon object' do
  #   # The find method creates a new Pokemon after selecting their row from the database by their id number.
  #   Pokemon.save("Pikachu", "electric", @db)

  #   pikachu_from_db = Pokemon.find(1, @db)
  #   expect(pikachu_from_db.id).to eq(1)
  #   expect(pikachu_from_db.name).to eq("Pikachu")
  #   expect(pikachu_from_db.type).to eq("electric")
  # end
  
end
