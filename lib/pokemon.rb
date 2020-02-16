class Pokemon
	attr_accessor :name, :type, :id, :db

	def initialize(name:, type:, id:, db:)
		@name = name
		@type = type
		@id = id
		@db = db
	end

	def self.save(name, type, db)
		sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
		db.execute(sql, name, type)
		# self.id = db.execute('SELECT last_insert_rowid() FROM pokemon')[0][0]
	end

	def self.find(id, db)
		sql = "SELECT * FROM pokemon WHERE id = ?"
		rows = db.execute(sql, id)
		rows.map {|row|
			Pokemon.new(name: row[1], id: row[0], db: db, type: row[2])
		}.first
	end

end
