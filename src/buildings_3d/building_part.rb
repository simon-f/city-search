module Buildings3D

  class BuildingPart

    attr_accessor :id, :name, :polygons

    def initialize(id, name, polygons)
      @polygons = polygons
      @id = id
      @name = name
    end

    # TODO: implementation
    def is_closed?
      return true
    end

    # TODO: implementation
    def is_valid?
      return true
    end

    def to_s
      return "Building Part, Name: #{@name}, Nr. Polygons: #{ @polygons.length }"
    end


  end
end