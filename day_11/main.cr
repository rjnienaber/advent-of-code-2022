require "big"

# worry_level = 3, iterations = 20, 64032
# worry_level = 1, iterations = 10000 12729522272
ITERATONS = 10000
WORRY_LEVEL = 1

class Monkey
  getter :number
  getter inspect_count = 0
  property item_worry_levels = [] of BigInt
  property worry_level = 0
  property operation = ""
  property divisible = 0
  property success_monkey = 0
  property fail_monkey = 0
  
  def initialize(@number : Int32, @monkey_lookup : Hash(Int32, Monkey), @modifier = 3)
  end

  def perform_turn
    loop do
      break if item_worry_levels.size == 0
      @inspect_count += 1
      throw_item(item_worry_levels.shift)
    end
    self
  end

  private def throw_item(item_worry_level : BigInt)
    value = (operate(item_worry_level) / @modifier).to_big_i % worry_level
    monkey_to_throw_to = (value % divisible) == 0 ? success_monkey : fail_monkey
    @monkey_lookup[monkey_to_throw_to].item_worry_levels << value
  end

  private def operate(item : BigInt)
    match = /new = old\s+([*+])\s+(\d+|old)/.match(operation)
    raise Exception.new("unknown operation: '#{operation}'") unless match
    value = match[2] == "old" ? item : match[2].to_i
    case match[1]
    when "*" then item * value
    when "+" then item + value
    else raise Exception.new("unknown operation: '#{operation}'")
    end
  end
end

monkeys = [] of Monkey
monkey_lookup = {} of Int32 => Monkey

ARGF.each_line do |line|
  case line
  when /Monkey (\d+):/
    monkey = Monkey.new($~[1].to_i, monkey_lookup, WORRY_LEVEL) 
    monkeys << monkey
    monkey_lookup[monkey.number] = monkey
  when /Starting items: (.+)$/
    monkeys[-1].item_worry_levels = $~[1].split(",").map { |v| BigInt.new(v)}
  when /Operation: (.+)$/
    monkeys[-1].operation = $~[1]
  when /Test: divisible by (\d+)$/
    monkeys[-1].divisible = $~[1].to_i
  when /If true: throw to monkey (\d+)/
    monkeys[-1].success_monkey = $~[1].to_i
  when /If false: throw to monkey (\d+)/
    monkeys[-1].fail_monkey = $~[1].to_i
  when "" then nil
  else raise Exception.new("line not processed: '#{line}'")
  end
end

worry_level = monkeys.reduce(1) { |acc, m| acc * m.divisible }
monkeys.each { |m| m.worry_level = worry_level }

(1..ITERATONS).each { |turn| monkeys.map(&.perform_turn) }

a, b = monkeys.sort_by(&.inspect_count).map(&.inspect_count)[-2..-1]
puts BigInt.new(a) * BigInt.new(b)
