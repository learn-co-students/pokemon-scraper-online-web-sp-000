class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_nu, db)
    poke_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_nu).flatten
    Pokemon.new(id: poke_info[0], name: poke_info[1], type: poke_info[2], hp: poke_info[3], db: db)
  end

  def initialize(id:, name:, type:, hp: nil, db:)
    @id, @name, @type, @hp, @db = id, name, type, hp, db
  end

  def alter_poke_hp(new_hp, db)
    db.execute("UPDATE pokemon SET poke_hp = ? WHERE id = ?", new_hp, self.id)
  end
end
