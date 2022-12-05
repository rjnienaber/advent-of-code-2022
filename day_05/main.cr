part_two = part_one = [] of Array(Char)
ARGF.each_line do |line|
  case line
  when /[A-Z]/
    part_one << (1..line.size).step(4).map { |i| line[i] }.to_a
  when /^[\d\s]+$/
    part_one = part_one.transpose.map(&.reject(' ').reverse)
    part_two = part_one.clone
  when /\d+/
    count, from, to = line.scan(/\d+/).map(&.[0].to_i)
    part_one[to - 1] += part_one[from - 1].pop(count).reverse
    part_two[to - 1] += part_two[from - 1].pop(count)
  end
end

puts part_one.map(&.last).join
puts part_two.map(&.last).join
