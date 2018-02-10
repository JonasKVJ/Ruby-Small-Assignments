#Problem 4 - sort (bubble sort, inefficient and lacks optimization)

def bubble_sort(array)
  n = array.length;
  if (n<2)
    print "Array needs to have at least two elements"
    return;
  end
  (n-1).times do |i| #i = number of rightmost sorted elements
    (n-1-i).times do |j| #Perform length-1 swap checks across the array left to right
      if (j+1<n) #Avoid exceeding the last element
        if array[j]>array[j+1]
          array[j], array[j+1] = array[j+1], array[j];
        end
      end
    end
  end
  return array;
end

test = [7,3,6,2,5,1];
print "bubble_sort(#{test}) = #{bubble_sort(test)}";
puts;
(test.length-1).times do |k|
  test[k] = rand(10);
end
print "bubble_sort(#{test}) = #{bubble_sort(test)}";
puts;

#Generate some random positive and negative numbers
(test.length-1).times do |k|
  test[k] = rand(100)*(-1)**k;
end
print "bubble_sort(#{test}) = #{bubble_sort(test)}";
puts;
