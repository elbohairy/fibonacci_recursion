def fibs(n)
  f1 = 0
  f2 = 1
  if n == 1
    [f1]
  elsif n == 2
    [f1, f2]
  end

  ary = [f1, f2]
  (n-2).times do |x|
    f3 = f1 + f2
    ary << f3
    f1 = f2
    f2 = f3
  end
  ary
end

puts "fibs(5) should return [0, 1, 1, 2, 3]: #{fibs(5)}"

def fibs_rec(n, seq=[0,1], f1=0, f2=1)
  return [0] if n == 1
  return seq if n == 2
  f3 = f1 + f2
  f1 = f2
  f2 = f3
  n -= 1
  seq << f3
  fibs_rec(n, seq, f1, f2)
end

puts "fibs_rec(5) should return [0, 1, 1, 2, 3]: #{fibs_rec(5)}"