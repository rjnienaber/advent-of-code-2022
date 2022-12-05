stacks = [] of Array(Char)
ARGF.each_line do |line|
  break if /\d/.matches?(line)
  stacks << (1..line.size).step(4).map { |i| line[i] }.to_a
end

stacks = stacks.transpose.map(&.reject(' ').reverse)

ARGF.gets

moves = ARGF.each_line.map(&.scan(/\d+/).map(&.[0].to_i)).to_a

def output(stacks, moves, reverse = True)
  moves.each do |(count, src, dest)|
    values = stacks[src - 1].pop(count)
    stacks[dest - 1] += reverse ? values.reverse : values
  end

  puts stacks.map(&.last).join
end

output(stacks.clone, moves, true) # TLFGBZHCN
output(stacks, moves, false)      # QRQFHFWCL
