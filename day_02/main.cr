SCORING = {"A" => 1, "B" => 2, "C" => 3}
WINNING = {"A" => "C", "B" => "A", "C" => "B"}
LOSING  = WINNING.invert

total = ARGF.each_line.sum do |line|
  opponent, outcome = line.split
  case outcome
  when "X" then 0 + SCORING[WINNING[opponent]]
  when "Y" then 3 + SCORING[opponent]
  when "Z" then 6 + SCORING[LOSING[opponent]]
  else 0
  end
end

p total # 10835
