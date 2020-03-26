require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :hp
  attr_reader :id

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
    # @id = db.execute("SELECT last_inserted_rowid() FROM pokemon")[0][0]
  end

  def self.find(id, db)
    sql = <<-SQL
    SELECT * FROM pokemon WHERE id = ?
    SQL
    row = db.execute(sql, id).flatten
    new_pokemon = Pokemon.new(id: row[0], name: row[1], type:row[2], hp: row[3], db: db)
    new_pokemon
  end
end
