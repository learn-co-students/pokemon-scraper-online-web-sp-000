class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize(arguments)
    arguments.each { |key, value| self.send(("#{key}="), value) }
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
  end

  def self.find(id, db)
    values = db.execute("SELECT id, name, type FROM pokemon WHERE id = ?", [id])
    arguments = { :id => values[0][0], :name => values[0][1], :type => values[0][2] }
    self.new(arguments)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [new_hp, self.id])
  end
end
