# Thoughts
# => When I first tried fibs_rec, I felt the question was written as though
# you could write the function recursively while providing an integer
# n as the only argument. I don't think that is possible, and would prefer
# the question make that less ambiguous.
# => I saw a really nice solution that simplifies mine a bit. Instead of 
# creating the optional parameters f1 and f2, and using them in the
# definition, you could just slice the last and second-last elements,
# add them together, and push them to seq. (By pushing them, the last
# and second-last elements change every call.)
#   My method would look like this:
      #def fibs_rec(n, seq=[0, 1])
      #  return [0] if n == 1
      #  return seq if n == 2
      #  n -= 1
      #  seq << seq[-1] + seq[-2]
      #  fibs_rec(n, seq)
      #end
# And I just realized, I don't even need to have the decrement line. I could 
# just subtract one in the fibs_rec call.
# => Author says it can be done in 3 lines, I assume excluding the def and end 
# lines. The solution I saw that does this doesn't decrement n. Instead it stops
# when the number of elements in the array equals n.

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