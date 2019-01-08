class Pokemon

  @@all = []

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp:nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.all
    @@all
  end

  def self.find(pkm_id, db)
    pkm_info = db.execute("SELECT * FROM pokemon WHERE id=?", pkm_id).flatten
    Pokemon.new(id: pkm_info[0], name: pkm_info[1], type: pkm_info[2], hp: pkm_info[3], db: db)

#    self.all.find do |pokemon|
#      pokemon.id = id
#    end
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end
