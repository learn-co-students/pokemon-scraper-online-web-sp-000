class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(args)
      @id = args[:id]
      @name = args[:name]
      @type = args[:type]
      @db = args[:db]

      @hp = args[:hp] if args.key?(:hp)
        
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL

    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = "PRAGMA table_info(pokemon)"
    if db.execute(sql).flatten.include?("hp")
      self.find_hp(id, db)
    else
      self.find_no_hp(id, db)
    end
  end

  def self.find_hp(id, db)
    sql = <<-SQL
      SELECT id, name, type, hp FROM pokemon
      WHERE id = ?
    SQL

    self.new(
      Hash.new.tap do |hash|
        hash[:id], hash[:name], hash[:type], hash[:hp] = db.execute(sql, id).first
      end
    )
  end

  def self.find_no_hp(id, db)
    sql = <<-SQL
      SELECT id, name, type FROM pokemon
      WHERE id = ?
    SQL

    self.new(
      Hash.new.tap do |hash|
        hash[:id], hash[:name], hash[:type] = db.execute(sql, id).first
      end
    )
  end

  def alter_hp(hp, db)
    @hp = hp
    sql = <<-SQL
      UPDATE pokemon SET hp = ?
      WHERE id = ?
    SQL
    #binding.pry
    db.execute(sql, hp, @id)
  end
end
