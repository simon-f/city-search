# test.rb

## parsing of the CityGML file

require 'nokogiri'
require_relative 'building_3d'


# read file and create nocogiri document
buildingFile = File.open("/home/simon/Studium/Bachelorarbeit/Daten/testdata/gebaeude.gml")
doc = Nokogiri::XML(buildingFile) do |config|
  config.strict.strict
end

buildingFile.close

# do the parsing
buildings = Array.new

doc.xpath('.//bldg:Building').each do |building_gml|

  # list to store all building parts from a single building
  building_parts = Array.new

  building_gml.xpath('.//bldg:BuildingPart').each do |building_part_gml|

    # list to store all polygons from a single building_part
    polygons = Array.new

    building_part_gml.xpath('.//gml:posList').each do |polygon_gml|

      # list to store all points from a single polygon
      points = Array.new

      # extract a float array of coordinates from the gml raw data
      raw_points_gml = polygon_gml.content.strip.split(' ').map { |s| s.to_f }

      # TODO: maybe this can be done in a more rubyish way?!
      # extract the first three values from the list that represent a single point
      while raw_points_gml.length > 2
        single_point_array = raw_points_gml.shift(3)

        north = single_point_array.shift
        east = single_point_array.shift
        height = single_point_array.shift

        # create point
        point = Buildings3D::Point.new(north, east, height)
        points.push(point)
      end

      #create polygon and add it to the list
      polygon = Buildings3D::Polygon.new(points)
      polygons.push(polygon)
    end

    name = building_part_gml.at_xpath('.//gml:name').content
    id = building_part_gml["gml:id"]

    #create building part and add it to the list
    building_part = Buildings3D::BuildingPart.new(id, name, polygons)
    building_parts.push(building_part)
  end

  name = building_gml.at_xpath('.//gml:name').content
  id = building_gml["gml:id"]

  building = Buildings3D::Building.new(id, name, building_parts)
  buildings.push(building)
end

#
## some statistics ##
#

puts "\n\n"
puts "number of buildings in this set: #{buildings.length}"
puts "number of building parts in this set: #{buildings.inject(0) { |sum, n| sum + n.building_parts.length }}"
puts "number of polygons in this set: #{ buildings.inject(0) { |sum, b| sum + b.building_parts.inject(0) { |sum2, bp| sum2 + bp.polygons.length } } }"
puts "number of points in this set: #{ buildings.inject(0) { |sum, b| sum + b.building_parts.inject(0) { |sum2, bp| sum2 + bp.polygons.inject(0) { |sum3, pol| sum3 + pol.polygon_points.length } } } }"