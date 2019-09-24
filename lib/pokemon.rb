class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize (pokehash)
    @id = pokehash[:id]
    @name = pokehash[:name]
    @type = pokehash[:type]
    @db = pokehash[:db]
  end

  def self.save (name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = ?", id).map do |row|
      self.new({:id => row[0], :name => row[1], :type => row[2], :db => db})
    end.first
  end
end
