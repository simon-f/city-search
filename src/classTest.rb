require_relative 'building_3d'

point_a = Buildings3D::Point.new(3456433.163000,5430249.143000,126.410000)
point_b = Buildings3D::Point.new(3456428.155000,5430250.332000,126.410000)


point_list = Array.new
puts point_list.first
point_list.push(point_a)
point_list.push(point_b)
point_list.push(point_a)

puts point_list.first
puts point_list.last
# puts point_list.push(point_a)


polygon_a = Buildings3D::Polygon.new(point_list)
puts polygon_a.is_closed?



puts point_a.distance(point_b)

p array = [1,2,3,4,5,6,7]
p array.shift(3)
p array
