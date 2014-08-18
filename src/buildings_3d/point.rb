require_relative 'feature'

# represents a point in gauss kruger coordinate space
module Buildings3D

  class Point < Feature

    attr_accessor :north, :east, :height

    def initialize(north, east, height)
      @north = north
      @east = east
      @height = height
    end

    # calculates the shortest distance to another point in the same zone
    # it is important to know, that this is accurate only for short distances
    def distance(point)
      return Math.sqrt((@north - point.north)**2 + (@east - point.east)**2 + (@height - point.height)**2)
    end

    # returns a string representation of the object
    def to_s
      return "(N #{ north }, E #{ east }, H #{ height })"
    end

    def ==(other)
      return self.north == other.north && self.east == other.east && self.height == other.height
    end

  end

end