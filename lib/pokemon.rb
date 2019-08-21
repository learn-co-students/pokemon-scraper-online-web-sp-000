class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(info_hash)
    info_hash.each{|key, value| self.send(("#{key}="), value)}
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
      SELECT *
      FROM pokemon
      WHERE id = #{id}
    SQL
    return_data = db.execute(sql)
    new_pokemon = Pokemon.new(self.create_info_hash(return_data[0], db))
    new_pokemon
  end

  def self.create_info_hash(array, db)
    hash = {}
    hash[:id] = array[0]
    hash[:name] = array[1]
    hash[:type] = array[2]
    hash[:db] = db
    hash
  end
end
