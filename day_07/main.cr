class Item
  getter items = [] of Item
  getter :name
  def initialize(@name : String, @size : Int32 | Nil = nil)
  end

  def dir?
    @size.nil?
  end

  def size
    dir? ? items.sum(&.size) : @size.as(Int32)
  end

  def find_all_dirs(dirs = [] of Item)
    return dirs unless dir?
    items.each(&.find_all_dirs(dirs))
    dirs << self
    return dirs
  end
end

ARGF.gets
root = Item.new("/")
cur_dir = [root] of Item

ARGF.each_line do |line|
  case line
  when "$ cd .." then cur_dir.pop
  when /^\$ cd/
    dir = cur_dir[-1].items.find { |i| i.name == line[5..] }
    cur_dir.push(dir) unless dir.nil?
  when /^dir/
    cur_dir[-1].items.push(Item.new(line[4..]))
  when /^(\d+) ([\w\.]+)$/
    _, size, name = $~
    cur_dir[-1].items.push(Item.new(name, size.to_i))
  end
end

p root.find_all_dirs.reject { |d| d.size > 100_000 }.map(&.size).sum # 1306611
required = root.size - (70000000 - 30000000)
p root.find_all_dirs.select { |d| d.size >= required }.sort_by(&.size)[0].size # 13210366
