class Pokemon
  attr_accessor :name, :id, :type, :db
  def initialize(args)
    args.each {|key, value| self.send("#{key}=", value)}
  end
  def self.save(name, type, db)
    sql = <<-SQL
            INSERT INTO pokemon (name, type) VALUES (?,?)
            SQL
    pokemon = db.execute(sql, name, type)
  end
  def self.find(id, db)
    sql = <<-SQL
            SELECT * FROM pokemon WHERE id=?
            SQL
    pokemon = db.execute(sql, id).first
    Pokemon.new(name: pokemon[1], type: pokemon[2], id: pokemon[0])
  end
end
