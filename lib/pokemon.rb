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
    db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', name, type)
  end

  def self.find(id, db)
    pokedex = db.execute('SELECT * FROM pokemon WHERE id = ?', id)[0]
    self.new(id: id, db: db, name: pokedex[1], type: pokedex[2], hp: pokedex[3])
  end

  def alter_hp(hp, db)
    db.execute('UPDATE pokemon SET hp = ? WHERE id = ?', hp, self.id)
  end

end
