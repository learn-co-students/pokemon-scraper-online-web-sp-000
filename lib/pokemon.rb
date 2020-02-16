class Pokemon
	attr_accessor :name, :type, :id
	attr_reader :db

	def initialize(id:, name:, type:, db:)
		@id = id
		@name = name
		@type = type
		@db = db
	end

	def self.save(name, type, db)
		sql = <<-SQL
			INSERT INTO pokemon (name, type)
			VALUES (?, ?)
		SQL

		db.execute(sql, name, type)
	end

  def self.new_from_db(row)
    # create a new Student object given a row from the database
    new_poke = self.new(id: nil, name: nil, type: nil, db: @db)
    new_poke.id = row[0]
    new_poke.name = row[1]
    new_poke.type = row[2]
    new_poke
  end

	def self.find(id, db)
		sql = <<-SQL
			SELECT * FROM pokemon 
			WHERE id = ?
		SQL

		db.execute(sql, id).map { |row| self.new_from_db(row) }.first
	end
end
