class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize (id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    ins = db.prepare('insert into pokemon (name, type) values ( ?, ? )')
    ins.execute(name, type)
  end

  def self.find(number, db)
    name = db.execute('SELECT name FROM pokemon WHERE id = (?)', [number])
    type = db.execute('SELECT type FROM pokemon WHERE id = (?)', [number])
    binding.pry
    new_poke = Pokemon.new(name: name.value, id: number, type: type.value, db:db)
  end
end
