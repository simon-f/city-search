module Buildings3D

  class Feature

    attr_accessor :id, :name

    def initialize(id, name)
      @id = id
      @name = name
    end

    def to_s
      return "Feature, Name: #{@name}, ID: #{@id}"
    end

  end
end