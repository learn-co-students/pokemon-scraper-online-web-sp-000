class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(name:,type:,db:nil,id:)
        @name = name
        @type = type
        @db = db
        @id = id
    end

    def self.save(name,type,db)
        sql_save = <<-SQL
        INSERT INTO pokemon(name,type)
        VALUES (?,?)
        SQL
        db.execute(sql_save,name,type)
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.create_from_db(row)
        pokemon = Pokemon.new(name: row[1], id: row[0], type: row[2])
        pokemon
    end
    
    def self.find(id,db)
        sql_find = <<-SQL
        SELECT * FROM pokemon
        WHERE id = ?
        SQL
        db.execute(sql_find,id).map {|pokemon| self.create_from_db(pokemon)}.first
    end

end
