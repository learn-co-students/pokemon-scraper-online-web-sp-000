class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    id, name, type, hp = db.execute("SELECT * FROM pokemon WHERE id = #{id}").flatten
    Pokemon.new(id: id, name: name, type: type, hp: hp, db: db)
  end

  def alter_hp(hp, dp)
    db.execute("UPDATE pokemon SET hp = #{hp} WHERE id = #{self.id}")
  end
end
