require_relative "environment"

Scraper.new(@db).scrape

all_pokemon = @db.execute("SELECT * FROM pokemon;")

# test out your code here!

# def milo
#   @db = SQLite3::Database.new('../pokemon.db')
#   @db.execute("DROP TABLE IF EXISTS pokemon")
#   @sql_runner = SQLRunner.new(@db)
#   @sql_runner.execute_schema_migration_sql
#   Pokemon.new(id: 1, name: "Pikachu", type: "electric", db: @db)
#   Pokemon.save("Pikachu", "electric", @db)
#   loki = @db.execute("SELECT * FROM pokemon WHERE name = 'Pikachu'")
#   loki
# end
# answer to "milo" should be [[1, "Pikachu", "electric"]]
#
#
#   @db = SQLite3::Database.new('../pokemon.db')
#   @db.execute("DROP TABLE IF EXISTS pokemon")
#   @sql_runner = SQLRunner.new(@db)
#   @sql_runner.execute_schema_migration_sql
#   Pokemon.new(id: 1, name: "Pikachu", type: "electric", db: @db)
#   Pokemon.save("Pikachu", "electric", @db)
#   sql = "SELECT * FROM pokemon WHERE id = ? LIMIT 1"
#
#   @db = SQLite3::Database.new('../pokemon.db')
#   @db.execute("DROP TABLE IF EXISTS pokemon")
#   @sql_runner = SQLRunner.new(@db)
#   @sql_runner.execute_schema_migration_sql
#   Pokemon.new(id: 1, name: "Pikachu", type: "electric", db: @db)
#   Pokemon.save("Pikachu", "electric", @db)
#      sql = "SELECT * FROM pokemon WHERE id = ?"
#      don = @db.execute(sql, 1).flatten
#
# binding.pry
# 0
