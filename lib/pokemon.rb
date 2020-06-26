class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(id:, name: , type:, db:)
    @id = nil
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type, db)
      VALUES (?,?)
    SQL

    db.execute(sql, self.name, self.type)
  end

  # def self.find
  #   sql = <<-SQL
  #     SELECT *
  #     FROM students
  #     WHERE id = ?
  #   SQL
  # end
end
