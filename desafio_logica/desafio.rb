ist = [510, 63, 7, 837, 36, 98, 9]
list.max
puts "The biggest element is: #{list.max}"


list_mim = [510, 63, 7, 837, 36,98,9]
list.min
puts "The smallest element is:: #{list.min}"

max = [510, 63, 7, 837, 36, 98, 9, 1051]
max_list = max.map(&:to_i).max
puts "The biggest element is: #{max_list}"