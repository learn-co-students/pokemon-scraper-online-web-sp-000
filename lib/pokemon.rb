class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(id: nil, name:, type:, db:)
      @id, @name, @type, @db = id, name, type, db
    end

    def self.save(name, type, db)
      sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
      SQL
      db.execute(sql, name, type)
    end

    def self.create_from_db(row, db)
      row = row.flatten
      self.new(id: row[0], name: row[1], type: row[2], db: db)
    end

    def self.find(id, db)
      sql = <<-SQL
        SELECT * FROM pokemon
        WHERE id = ?
      SQL
      self.create_from_db(db.execute(sql, id), db)
    end


end
