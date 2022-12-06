o=gets.to_s.chars
[4,14].map{|n|p o.each_cons(n).index!{|v|v.uniq==v}+n}