#Problem 6 - Recognizer methods
#The purpose of these methods was to extend the Array class with limited? and sorted?
#so they extend the native Ruby library and can be called on any array object

class Array
  def limited?(amin, amax)
    self.length.times do |i|
      if self[i]<amin || self[i]>amax
        return false
      end
    end
    return true
  end

  def sorted?
    checkIncreasing = false
    checkDecreasing = false
    if self[0]<self[1] #Do  a quick check for any initial pattern
      checkIncreasing = true
    elsif self[0]>self[1]
      checkDecreasing = true
    elsif self[0]==self[1]
      i = 0;
      while (i+1)<self.length #check if all elements are the same
        if self[i]<self[i+1]
          checkIncreasing = true
        elsif self[i]>self[i+1]
          checkDecreasing = true
        end
        i += 1;
      end
      if checkDecreasing==false && checkIncreasing==false #If all elements are identical, it can't be sorted
        return 0
      end
    end

    secondToLast = self.length-1 #Do length-1 comparisons
    secondToLast.times do |i| #i=0,1,2 for (0..3)
      if checkIncreasing
        if self[i]<self[i+1]
          if (i+1) == length-1 #if this is the last cycle of the times loop
            return 1
          end
          next
        else #The sequence stopped increasing
          return 0;
        end
      end
      if checkDecreasing
        if self[i]>self[i+1]
          if (i+1) == self.length-1 #if this is the last cycle of the times loop
            return -1
          end
          next
        else
          return 0
        end
      end
    end
  end
end

test = [1, 2, 3, 4];
print "array #{test}, test.limited?(2,4) = "; puts test.limited?(2, 4)
print "array #{test}, test.limited?(1,4) = "; puts test.limited?(1, 4)

test2 = [4, 3, 2, 1]
test3 = [4, 4, 4, 4]
test4 = [4, 1, 3, 2]
print "array #{test}, test.sorted? = "; puts test.sorted?
print "array #{test2}, test.sorted? = "; puts test2.sorted?
print "array #{test3}, test.sorted? = "; puts test3.sorted?
print "array #{test4}, test.sorted? = "; puts test4.sorted?
