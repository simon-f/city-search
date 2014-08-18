module Features

  class Mesh

    attr_accessor :mesh_polygons

    def initialize(mesh_polygons)
      @mesh_polygons = mesh_polygons
    end


    # true if mesh represents a closed surface
    # TODO: implementing
    def is_closed?
      return true
    end

    # true if mesh is valid
    # conditions:
    #  - is_closed?
    #  - e.g.
    # TODO: implementing
    def is_valid?
      return true
    end


  end

end