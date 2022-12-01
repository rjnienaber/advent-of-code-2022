t = ARGF.gets_to_end.split("\n\n").map(&.split.map(&.to_i)).map(&.sum).sort; p t[-1]; p t[-3..].sum
