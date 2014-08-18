module Features

  class Geometry_3D

    attr_accessor :parts

    def initialize (parts)
      @parts = parts
    end


    # true if the parts of the feature are connected
    def is_connected?
      return true
    end

  end

end