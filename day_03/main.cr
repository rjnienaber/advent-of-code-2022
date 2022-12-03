t = ARGF.each_line.in_groups_of(3).sum do |lines|
  (lines.compact.map { |v| Set.new(v.chars) }.reduce { |acc, s| acc & s }.first.ord - 96) % 58
end

p t # 2609
