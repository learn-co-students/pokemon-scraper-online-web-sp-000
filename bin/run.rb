require_relative "environment"

Scraper.new(@db).scrape

DB = {:conn => SQLite3::Database.new("db/pokemon.db")}

all_pokemon = @db.execute("SELECT * FROM pokemon;")

# test out your code here!
