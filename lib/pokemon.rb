class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(attributes)
    @name = attributes[:name]
    @type = attributes[:type]
    @db = attributes[:db]
    @id = attributes[:id]
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon
      WHERE id = ?
    SQL
    values = db.execute(sql, id).first
    attributes = {id: values[0], name: values[1], type: values[2]}
    pokemon = self.new(attributes)
  end
end
