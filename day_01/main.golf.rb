t=ARGF.map(&:to_i).chunk_while{_1>0}.map(&:sum);p t.max;p t.max(3).sum