require 'yaml'

# Collection of starships from different fictional settings
class Starship
  extend Mollusk

  def self.all
    yaml_path = File.dirname(__FILE__) + '/starships.yml'
    YAML.load_file(yaml_path)[:starships]
  end

  filter :star_wars, -> { select { |s| s[:universe] == 'Star Wars' } }
end
