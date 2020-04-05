class Pokemon
    attr_accessor :id, :name, :type, :db
    def initialize(id:, name:, type:, db: )
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(pk_name, pk_type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type) VALUES (?, ?)
        SQL
        db.execute(sql, pk_name, pk_type) 
    end

    def self.find(chosen_id, db)
        sql = <<-SQL
            SELECT *
            FROM pokemon
            WHERE id = ?
            LIMIT 1
        SQL
        db.execute(sql, chosen_id).map do |row|
            self.new(id: row[0], name: row[1], type: row[2], db: db)
        end.first
    end

end
