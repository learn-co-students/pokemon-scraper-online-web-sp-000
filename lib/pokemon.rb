class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize (args)
    args.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?);", name, type)
  end

  def self.find(id, db)
    new_pk = db.execute("SELECT * FROM pokemon WHERE id = ?;", id)
    Pokemon.new(id: new_pk[0][0], name: new_pk[0][1], type: new_pk[0][2], hp: new_pk[0][3])
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?;", new_hp, self.name)
    self.hp = new_hp
  end
end
