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
      base.send :define_singleton_method, :_mollusk_base_class, -> { base }
      collection_module =
        Mollusk::Collection.const_set base.name.to_sym, Module.new
      base.send :define_singleton_method, :_mollusk_collection_module, -> { collection_module }
      base.set_collection_method :all
    end

    def filter(name, callback)
      _mollusk_collection_module.send :define_method, name, &callback
      define_singleton_method(name) do
        collection = self == _mollusk_base_class ? _mollusk_base_class.send(_mollusk_collection_method) : self
        results = collection.instance_exec(&callback)
        (class << results; self end).send :include, _mollusk_collection_module
        results
      end
    end

    def set_collection_method(method_name)
      _mollusk_base_class.send :define_singleton_method, :_mollusk_collection_method, -> { method_name.to_sym }
    end
  end
end
