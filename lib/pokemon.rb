require "pry"
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id: , name: , type: , db:, hp: 60)
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

  def self.find(l_id, db)
    found = db.execute("SELECT id, name, type FROM pokemon WHERE id = ?", l_id)
    poke_object = @@all.detect {|pokemon| pokemon.id == found[0][0]}

      if poke_object == nil
        p_id = found[0][0]
        p_name = found[0][1]
        p_type = found[0][2]
        Pokemon.new(id: p_id, name: p_name, type: p_type, db: db)
      else
        poke_object
      end
  end

  def alter_hp(p_hp, db)
    name = self.name
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", p_hp, name)
    found = db.execute("SELECT hp FROM pokemon WHERE name = ?", name)
    self.hp = found[0][0]
  end

end
