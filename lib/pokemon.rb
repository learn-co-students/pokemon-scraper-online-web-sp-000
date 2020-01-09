require 'pry'

class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(attribute)
    @id = attribute[:id]
    @name = attribute[:name]
    @type = attribute[:type]
    @db = attribute[:db]
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES ("#{name}", "#{type}")
    SQL
    db.execute(sql)
  end

  def self.find(id, db)
    sql = <<-SQL
     SELECT *
     FROM pokemon
     WHERE id = "#{id}"
     LIMIT 1
    SQL
  row = db.execute(sql)
  attribute = {
    :id => row[0][0] ,
    :name => row [0][1],
    :type => row [0][2]
  }
  Pokemon.new(attribute)
  end

end
