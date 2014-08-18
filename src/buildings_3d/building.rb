require_relative 'feature'

module Buildings3D

  class Building < Feature

    attr_accessor :id, :name, :building_parts

    def initialize(id, name, building_parts)
      @id = id
      @name = name
      @building_parts = building_parts
    end

    #TODO: implementation
    def is_connected?
      return true
    end

    def to_s
      return "Building, Name: #{@name}, Nr. Building Parts: #{@building_parts.length}"
    end

  end
end