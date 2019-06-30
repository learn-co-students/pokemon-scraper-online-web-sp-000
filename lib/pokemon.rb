class Pokemon
  attr_accessor :name, :type, :db, :id
  
  def initialize(id: nil, name:, type:, db:)
    @id = id 
    @name = name
    @type = type 
    @db = db 
  end 
  
  def self.save(name, type, db)
    db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', name, type)
    @id = db.execute('SELECT last_insert_rowid() FROM pokemon')[0][0]
  end 
  
  def self.find(id, db)
    row = db.execute('SELECT * FROM pokemon WHERE id = ?', id)[0]
    pokemon = Pokemon.new(id: row[0], name: row[1], type: row[2], db: db)
  end
end
