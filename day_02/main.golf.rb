p$<.map{_1.gsub /\s+/,''}.sum{%w[_ BX CX AX AY BY CY CZ AZ BZ].find_index _1}
