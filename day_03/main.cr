t = ARGF.each_line.in_groups_of(3).sum do |lines|
  ord = lines.compact.map { |v| Set.new(v.chars) }.reduce { |acc, s| acc & s }.first.ord
  ord - (ord > 90 ? 96 : 38)
end

p t # 2609