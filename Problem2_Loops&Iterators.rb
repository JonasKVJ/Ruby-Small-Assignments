# Problem_2: Loops and iterators
i=0;
print 'while: ';
while i<10 do
  print "#{i} ";
  i=i+1;
end
puts;

print 'until: ';
until i==20 do
  print "#{i} ";
  i=i+1;
end
puts;

test = [1,2,3,4];
print 'for: ';
for number in test do
  print "#{number} ";
end
puts;

print 'upto: ';
20.upto(25) do
  |n| print n.to_s + " ";
end
puts;

15.downto(1) do
  print "downto ";
end
puts;

n=7;
n.times {print "testing times "};
puts;

test.each{|num_in_array| print "component: #{num_in_array} " ;}
puts;

hashtest={"bird" => 1, "turtle" => 2, "chicken" => 3, "cow" => 4};
hashtest.each do
|key, value| print "key,value = #{key},#{value}  ";
end
puts;

print 'map: ';
test.map{|n| print "#{n}^#{n} = #{n**n}    ";}
puts;

print 'step: ';
x,y=0,0;
x.step(2.5, 0.5) do |x|
  print "(x,y) = (#{x}, #{y})  ";
  y=y+1;
end
puts;

print 'collect: ';
def multiply5 (x);
  x*5;
end
numArray = [1,2,3,4];
result = numArray.collect{|number| multiply5(number)};
print result;
puts;

result = numArray.select{|n| n%3==0;}
print "selected " + "#{result} from result";
puts;

result = numArray.reject{|n| n%3==0;}
print "selected " + "#{result} from result (with reject)";
puts;

i=0;
print "loop:"
loop do
  i=i+1;
  if i>10
    break;
  end
  print " #{i}";
end
puts;
puts;
puts '---reading a file---';
File.open("testdata.txt") do |file|
  file.each{|singleline|print singleline}
end