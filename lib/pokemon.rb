class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
  end

  def self.save
    sql = "INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)"
    @db.execute(sql, self.id, self.name, self.value)
  end

  def find
  end

end
