class Pokemon

    attr_accessor :id, :name, :type
    attr_reader :db

    def initialize(pokemon)
        @name = pokemon[:name]
        @type = pokemon[:type]
        @id = pokemon[:id]
        @db = pokemon[:db]
    end

    def self.save(name, type, db)
        sql = <<-SQL
        INSERT into pokemon (name, type)
        VALUES (?,?)
        SQL
        db.execute(sql, name, type)
    end

    def self.find(id_number, db)
        sql = <<-SQL 
        select * FROM pokemon WHERE id = ?
        SQL
        db.execute(sql,id_number).map do |row| self.new_from_db(row)
        end.first
    end

    def self.new_from_db(row)
        puts row.class
        puts row[0]
        puts row[1]
        puts row[2]

        new_pokemon = self.new({id:row[0], name:row[1], type:row[2]});
        new_pokemon
    end

end # of class

