module Features

  # represents a line ()consists of >=2 points)
  class Polyline

    attr_accessor :line_points

    def initialize (line_points)
      @line_points  = line_points
    end

    # true if all points are level (have the same height coordinate)
    def is_plain?
      height_first = line_points.first.height
      return line_points.inject(true) { |boolean_value, point| boolean_value && (point.height == height_first) }
    end

    # returns the number of points
    def count
      return line_points.count
    end

    # true when the line consists of at least two points
    # TODO: possibly impose further conditions for validity (e.g. no intersecting parts, line lies within a plane surface, ...)
    def is_valid?
      return (self.count >= 2)
    end


  end

end