module Mollusk
  # Extend a class with this module to enable filters
  #
  # Example:
  #
  # class Widget
  #   extend Mollusk::Filterable
  #
  #   def self.all
  #     %w( foo bar baz )
  #   end
  #
  #   filter :starts_with_b, -> { select { |w| w.chars.first == 'b' } }
  #   filter :long,          -> { select { |w| w.length > 3 } }
  #  end
  #
  #  Widget.starts_with_b #=> ['bar', 'baz']
  module Filterable
    def self.extended(base)
      define_method(:_mollusk_base_class) { base }
      collection_module =
        Mollusk::Collection.const_set base.name.to_sym, Module.new
      define_method(:_mollusk_collection_module) { collection_module }
    end

    def filter(name, callback)
      _mollusk_collection_module.send :define_method, name, &callback
      define_singleton_method(name) do
        collection = self == _mollusk_base_class ? all : self
        results = collection.instance_exec(&callback)
        mod = _mollusk_collection_module
        (class << results; self end).send :include, mod
        results
      end
    end
  end
end
