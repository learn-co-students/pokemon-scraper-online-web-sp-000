class Pokemon

  attr_reader :id, :name, :type, :db
  attr_accessor :hp

   def initialize(id:, name:, type:, db:, hp: nil)
     @id = id
     @name = name
     @type = type
     @db = db
     @hp = hp
   end

    def self.save(name, type, db)
      sql = <<-SQL
        INSERT INTO pokemon(name, p_type)
        VALUES(?, ?)
        SQL
      db.prepare(sql).execute(name, type)
    end

    def self.find(id_number, db)
      pokemon_from_db = db.execute("SELECT * FROM pokemon WHERE id=?", id_number).first
      Pokemon.new(id: pokemon_from_db[0],
                  name: pokemon_from_db[1],
                  type: pokemon_from_db[2],
                  hp: pokemon_from_db[3],
                  db: db )
    end

    def alter_hp(new_hp, db)
      db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
    end

end
