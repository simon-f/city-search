require_relative 'feature'


# represents a polygon which is a (valid) list of Points
module Buildings3D

  class Polygon < Feature

    attr_accessor :points

    def initialize(points)
      @polygon_points = points

      # raise InvalidPolygonError.new(false, true, true), 'polygon is not closed', caller if !is_closed?
    end

    # true if startpoint equals endpoint
    def is_closed?
      return @polygon_points.first == @polygon_points.last
    end

    #  true if polygon is valid
    # TODO: also check if plain and regular1
    def is_valid?
      return is_closed? && (@polygon_points.length >= 3)
    end

    # returns a string representation of the object
    def to_s
      result = "Polygon, Nr. of Points: #{@polygon_points.length}"
      # @points.each { |point| result = result + point.to_s + ', '}

      return result
    end

  end

  class InvalidPolygonError < RuntimeError
    attr :isClosed, :isEnough, :isPlain

    def initialize(isClosed, isEnough, isPlain)
      @isClosed = isClosed
      @isEnough = isEnough
      @isPlain = isPlain
    end

  end


end