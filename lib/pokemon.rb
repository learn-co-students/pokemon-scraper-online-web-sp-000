class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT into pokemon (name, type) values (?, ?)", name, type)
  end

  def self.find(id, db)
    vals = db.execute("SELECT * from pokemon where id = ?", id).flatten
    pokemon = Pokemon.new(id: id, name: vals[1], type: vals[2], db: db, hp: vals[3])
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon set hp = ? where id = ?", hp, self.id)
  end
end
