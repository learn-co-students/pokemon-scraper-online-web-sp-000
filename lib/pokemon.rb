class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(pokemon)
    @id = pokemon[0]
    @name = pokemon[1]
    @type = pokemon[2]
    @hp = pokemon[3]
  end

  def self.save(pk_name, pk_type, pk_db)
    pk_db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",pk_name, pk_type)
  end

  def self.find(pk_id, pk_db)
    pokemon = pk_db.execute("SELECT * FROM pokemon WHERE pokemon.id = #{pk_id}").flatten
    Pokemon.new(pokemon)
  end

  def alter_hp(altered_hp, db)
    db.execute("UPDATE pokemon SET hp = #{altered_hp} WHERE #{self.id} = pokemon.id;")
  end
end
