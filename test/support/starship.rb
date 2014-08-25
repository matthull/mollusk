require 'yaml'

# Collection of starships from different fictional settings
class Starship
  extend Mollusk::Filterable

  def self.all
    yaml_path = File.dirname(__FILE__) + '/starships.yml'
    YAML.load_file(yaml_path)[:starships]
  end

  filter :star_wars, -> { select { |s| s[:universe] == 'Star Wars' } }
  filter :star_trek, -> { select { |s| s[:universe] == 'Star Trek' } }
  filter :fighters,  -> { select { |s| s[:type] == 'Fighter' } }
end
