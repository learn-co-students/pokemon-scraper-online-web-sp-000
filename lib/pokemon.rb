
class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id
    
    def initialize (id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save (name, type, db)
        # if self.id
            # self.update
        # else
            sql = <<-SQL
                INSERT INTO pokemon(name, type)
                VALUES (?, ?)
            SQL

            db.execute(sql, name, type)
            id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
        # end
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"

        result = db.execute(sql, id).first
        # binding.pry
        Pokemon.new(id: id, name: result[1], type: result[2], db: result[3])
    end
    




end
