require "mollusk/version"

module Mollusk
  def filter(name, callback)
    define_singleton_method(name) do
      all.instance_exec(&callback)
    end
  end
end
