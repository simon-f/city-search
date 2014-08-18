
module Features

  # represents the geometry of a feature
  class Geometry

    attr_accessor :id, :name

    def initialize (id, name)
      @id    = id
      @name  = name
    end

  end
end
