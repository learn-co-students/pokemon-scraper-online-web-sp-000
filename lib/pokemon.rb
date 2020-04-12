require 'pry'
class Pokemon

  attr_accessor :name, :type, :id, :db, :hp

  def initialize(name:, type:, db:, id:, hp: nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM Pokemon WHERE id = ?", id).map {|row| Pokemon.new(id: row[0], name: row[1], type: row[2], hp:row[3], db:db)}.first
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end
