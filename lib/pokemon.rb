class Pokemon
  attr_reader :id, :name, :type, :hp, :db

  @@hp_exists = false
  def self.create_hp
    @@hp_exists = true
  end

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
    @hp = hash[:hp]
    @db = hash[:db]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}')")
  end

  def self.find(id, db)
    select_statement = "SELECT id, name, type#{@@hp_exists ? ", hp" : ""} " \
                        "FROM pokemon WHERE id = #{id}"
    pokemon_array = db.execute(select_statement).first
    Pokemon.new({ id: id,
                  name: pokemon_array[1],
                  type: pokemon_array[2],
                  hp: pokemon_array[3],
                  db: db })
  end

  def alter_hp(new_hp_value, db)
    @hp = new_hp_value
    db.execute("UPDATE pokemon SET hp = #{new_hp_value} WHERE id = #{@id}")
  end
end
