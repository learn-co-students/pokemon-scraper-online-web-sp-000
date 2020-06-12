class Scraper
  attr_accessor :file, :parsed_file, :all_pokemon, :db

  def initialize(db)
    self.db = db
    self.file = File.open("pokemon_index.html")
    self.parsed_file = Nokogiri::HTML.parse(file)
    self.all_pokemon = catch_em_all
    binding.pry
  end

  def catch_em_all
    self.all_pokemon = parsed_file.css(".infocard-tall")
    binding.pry
  end

  def get_pokemon_name_from(node)
    node.css(".ent-name").text
    binding.pry
  end

  def get_pokemon_type_from(node)
    node.css(".itype").text
    binding.pry
  end

  def scrape
    all_pokemon.each do |pk_node|
      pk_name = get_pokemon_name_from(pk_node)
      pk_type = get_pokemon_type_from(pk_node)
      Pokemon.save(pk_name, pk_type, db)
    end
    binding.pry
  end

end
