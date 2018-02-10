#Problem 5 - Classes
class Triangle
  def initialize(angle1, angle2, angle3, lenAB, lenBC, lenCA)
    @A, @B, @C = angle1.to_f, angle2.to_f, angle3.to_f; #Angles A (between AB and CA), B (AB and BC), C (BC and CA)
    @AB, @BC, @CA = lenAB.to_f, lenBC.to_f, lenCA.to_f;
    @area = -1.0;
    @isRightAngled = false
    @isTriangle = false
    @perimeter = -1.0;
    @triangleType = ""
  end


#Could also use attr_accessor :AB, :BC, :CA instead, to autogenerate accessors

#getters
  def A
    @A;
  end

  def B
    @B;
  end

  def C
    @C;
  end

  def AB
    @AB;
  end

  def BC
    @BC
  end

  def CA
    @CA
  end

  def area
    @area
  end

  def isRightAngled
    @isRightAngled
  end

  def isTriangle
    @isTriangle
  end

  def perimeter
    @perimeter
  end

  def triangleType
    @triangleType
  end

#setters
  def A=(angle)
    @A = angle
  end

  def B=(angle)
    @B = angle
  end

  def C=(angle)
    @C = angle
  end

  def AB=(len)
    @AB = len
  end

  def BC=(len)
    @BC = len
  end

  def CA=(len)
    @CA = len
  end

  def area=(newVal)
    @area = newVal
  end

  def isRightAngled=(newVal)
    @isRightAngled = newVal
  end

  def isTriangle=(newVal)
    @isTriangle = newVal
  end

  def perimeter=(newVal)
    @perimeter = newVal
  end

  def triangleType=(newVal)
    @triangleType = newVal
  end

#member functions
  def getPerimeter()
    self.test_triangle(); #Make sure all attributes of the instance are calculated and set
    if self.isTriangle
      perimeter = self.AB+self.BC+self.CA;
      self.perimeter = perimeter
      return perimeter
    else
      return -1
    end
  end

  def getArea()
    self.test_triangle();
    if self.isTriangle==false
      print "Not a valid triangle, can't compute the area"
      return -1
    end

    if self.isRightAngled #If triangle is right-angled, use the simplest area formulae
      #A = (ab)/2, where a and b are the legs
      if self.A==90 #AB and AC are the legs
        area = (self.AB*self.CA)/2
        self.area = area;
        return area
      elsif self.B==90 #AB and BC are the legs
        area = (self.AB*self.BC)/2
        self.area = area;
        return area
      elsif self.C==90 #CA and BC are the legs
        area = (self.CA*self.BC)/2
        self.area = area;
        return area
      end
    elsif self.isRightAngled==false
      if self.triangleType = "equilateral"
        area = (Math.sqrt(3)/4)*(self.AB**2)
        self.area = area;
        return area
      elsif self.triangleType = "isosceles" #A = 0.5*a**2*Math.sqrt(b**2/a**2-0.25) where a is not a leg and b is
        if self.A==self.B #CA and BC are legs, AB is not
          area = 0.5*(self.AB)**2*Math.sqrt((self.CA**2)/(self.AB)**2-0.25)
          self.area = area;
          return area
        elsif self.A==self.C #AB and BC are legs, CA is not
          area = 0.5*(self.CA)**2*Math.Math.sqrt((self.AB**2)/(self.CA)**2-0.25)
          self.area = area;
          return area
        elsif self.B==self.C #AB and CA are legs, BC is not
          area = 0.5*(self.BC)**2*Math.sqrt((self.AB**2)/(self.BC)**2-0.25)
          self.area = area;
          return area
        end
      elsif self.triangleType = "scalene" #Use Heron's formulae
        self.getPerimeter(); #Find perimeter and set @perimeter to the found value
        s = self.perimeter/2
        area = Math.sqrt(s*((s-self.AB)*(s-self.BC)*(s-self.CA)))
        self.area = area;
        return area;
      else
        return -1
      end
    end
  end

  def test_triangle()
    if self.A+self.B+self.C==180
      if self.AB > 0 && self.BC > 0 && self.CA > 0
        self.isTriangle = true;
      end
    else
      self.triangleType = "Not a triangle"
    end

    if [self.A, self.B, self.C].uniq.count==1 #uniq: removes duplicates, count: returns 1 if all elements are the same
      if [self.AB, self.BC, self.CA].uniq.count==1
        if self.isTriangle
          self.triangleType = "equilateral"
        end
      else
        puts "equilateral "
      end
    end

    if self.A==self.B || self.A==self.C || self.B==self.C
      if self.A==self.B #BC and #CA must be the legs
        if self.BC == self.CA && self.isTriangle
          self.triangleType = "isosceles"
        end
      elsif self.A==self.C #AB and BC are the legs
        if self.AB == self.BC && self.isTriangle
          self.triangleType = "isosceles"
        end
      elsif self.B==self.C #AB and CA are the legs
        if self.AB == self.CA && self.isTriangle
          self.triangleType = "isosceles"
        end
      else
        puts "The isosceles triangle does not have the legs located at the correct angles"
      end
    end

    if self.A!=self.B && self.A != self.C && self.B != self.C
      if self.AB != self.BC && self.AB != self.CA && self.BC!= self.CA
        if self.isTriangle
          self.triangleType = "scalene"
        end
      else
        print "Scalene triangles must have three different side lengths"
      end
    end

    #puts self.A;
    if (self.A == 90 && self.B!=90 && self.C !=90||self.A != 90 && self.B==90 && self.C !=90||self.A != 90 && self.B!=90 && self.C ==90)
      self.isRightAngled = true;
    end

    return #return from test_triangle
  end

end #end Triangle

equilateral = Triangle.new(60, 60, 60, 7, 7, 7)
equilateral.test_triangle()
puts "equilateral area = #{equilateral.getArea()}, perimeter = #{equilateral.getPerimeter()}, isRightAngled = #{equilateral.isRightAngled}"

isosceles = Triangle.new(30, 30, 120, 10, 10, 15)
isosceles.test_triangle()
puts "isosceles area = #{isosceles.getArea()}, perimeter = #{isosceles.getPerimeter()}, isRightAngled = #{isosceles.isRightAngled}"

scalene = Triangle.new(30, 40, 110, 30, 40, 50)
scalene.test_triangle()
puts "scalene area = #{scalene.getArea()}, perimeter = #{scalene.getPerimeter()}, isRightAngled = #{scalene.isRightAngled}"

rightangle = Triangle.new(90, 40, 50, 3, 4, 5)
rightangle.test_triangle()
puts "rightangled area = #{rightangle.getArea()}, perimeter = #{rightangle.getPerimeter()}, isRightAngled = #{rightangle.isRightAngled}"
