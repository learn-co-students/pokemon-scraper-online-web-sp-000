class Pokemon

    attr_accessor :id, :name, :type, :db

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

    def self.find(pk_id, db)
        sql = <<-SQL
            SELECT * 
            FROM pokemon WHERE id = ?
        SQL
        pk_info = db.execute(sql, pk_id).flatten!
        self.new(id: pk_info[0], name: pk_info[1], type: pk_info[2], db: db)
    end
end



