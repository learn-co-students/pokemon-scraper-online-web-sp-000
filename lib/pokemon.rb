require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    poke = db.execute("select name, type from pokemon where id = ?", id)[0]
    Pokemon.new(id: id, name: poke[0], type: poke[1], db: db)
  end
  
  def alter_hp(new_hp, db)
    @hp = new_hp
    db.execute("update pokemon set hp = ? where id = ?", new_hp, @id)
  end
end
