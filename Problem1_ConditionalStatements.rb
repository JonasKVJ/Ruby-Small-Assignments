# Problem_1: Conditional statement
x,y = 1,2;

print 'if-then: ';
if x+y>2 then # Works because > has lower precedence than +
  puts "x+y > 2";
end

print 'if-elsif: ';
if x+y > 4
  puts "x+y > 4";
elsif x+y < 4
  puts "x+y < 4";
end

print 'if-elsif-else: ';
if x+y > 3
  puts "x+y > 3";
elsif x+y < 3
  puts "x+y < 3";
else
  puts "x+y = 3";
end

print 'unless: ';
puts "x is not 2" unless x==2;

print 'unless-else: ';
unless y==2 then
  puts "y is not 2"
else
  puts "y is 2";
end

print 'if-unless: ';
if x+y == 3
  unless y < 1
    puts "x+y = 3 and y >= 1";
  end
end

print 'value = case: ';
address = "1 East Bayberry Street";
name = case
         when address=="20 Maple Avenue"
           name = "Bob";
         when address=="1 East Bayberry Street"
           name = "Johnny";
         else
           name = "unknown";
       end
puts "#{name} was found";

print 'case-selector: ';
temperature = 300;
case temperature
  when (20..99)
    puts 'Low, keep preheating';
  when (100..299)
    puts 'Medium, keep preheating';
  when (300..350)
    puts 'Stop preheating and halt at ~350';
end

