require 'pry'
class Triangle
  attr_accessor :side1, :side2, :side3
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    if !is_a_triangle?(@side1, @side2, @side3)
      raise TriangleError
    else
     if self.is_isosceles?(@side1, @side2, @side3)
        return :isosceles
      elsif self.is_scalene?(@side1, @side2, @side3)
        return :scalene
      elsif self.is_equilateral?(@side1, @side2, @side3)
        return :equilateral
      end

    end
  end

  def is_isosceles?(s1, s2, s3)
    equal?(s1, s2) && !equal?(s1, s3) && !equal?(s2, s3) || equal?(s1, s3) && !equal?(s1, s2) && !equal?(s2, s3) || equal?(s2, s3) && !equal?(s1, s2) && !equal?(s1,s3)
  end

  def is_scalene?(s1, s2, s3)
    !equal?(s1, s2) && !equal?(s1, s3) && !equal?(s2, s3)
  end

  def is_equilateral?(s1, s2, s3)
    equal?(s1, s2) && equal?(s1, s3)
  end

  def equal?(s1, s2)
    s1 == s2
  end

  def is_a_triangle?(s1, s2, s3)
    is_size_valid?(s1, s2, s3) && s1 + s2 > s3 && s1 + s3 > s2 && s2 + s3 > s1
  end

  def is_size_valid?(s1, s2, s3)
    s1 > 0 && s2 > 0 && s3 > 0
  end

  class TriangleError < StandardError
  end
end