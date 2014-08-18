module Features

  # represents a geographical feature
  class Feature

    attr_accessor :name, :id, :description, :geometry

    def initialize (name, id, description, geometry)
      @name = name
      @id = id
      @geometry = geometry
      @description = description
    end

  end

end