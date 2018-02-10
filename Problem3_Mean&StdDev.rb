#Problem 3 - mean and standard deviation

def mean(a)
  sum = 0.0;
  i = 0;
  a.each{|n|; a[i] = n.to_f; i += 1;} #convert array to float to avoid accuracy loss during division
  a.each{|n|; sum += n;}
  mean = sum/a.length.to_f;
  return mean;
end

#Method to find and return both the mean and the standard deviation
def mean_sigma(v)
  mean = mean(v);
  diff = [];
  mean_delta = 0.0;
  i=0;
  v.each{|n|; mean_delta = (n-mean).abs; diff[i] = mean_delta; i += 1;}
  std_dev = mean(diff);
  return mean, std_dev;
end

v1, v2, v3 = [1,2,3], [-1,-2,-3], [-1, 2, -3];
mean1, std_dev1 = mean_sigma(v1);
print "array: #{v1}, mean = #{mean1}, standard deviation = #{std_dev1}"; puts;
mean2, std_dev2 = mean_sigma(v2);
print "array: #{v2}, mean = #{mean2}, standard deviation = #{std_dev2}"; puts;
mean3, std_dev3 = mean_sigma(v3);
print "array: #{v3}, mean = #{mean3}, standard deviation = #{std_dev3}"; puts;

