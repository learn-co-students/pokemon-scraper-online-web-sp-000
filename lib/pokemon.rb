class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
      SQL
    db.execute(sql, name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

  def self.find(id_num, db)
    row = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
    new_pokemon = self.new(id: row[0], name: row[1], type: row[2], db: row[3])
  end

end
