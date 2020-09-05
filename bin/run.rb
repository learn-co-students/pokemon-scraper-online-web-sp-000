require_relative "environment"
require_relative "../lib/pokemon"

Scraper.new(@db).scrape

# all_pokemon = @db.execute("SELECT * FROM pokemon;")

# test out your code here!



@db.execute("SELECT * FROM pokemon WHERE id = 4;").map {|pokemon| puts pokemon }
