class Triangle
  attr_accessor :side1, :side2, :side3
  
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    validate_triangle
    # The kind method first calls a validate_triangle private method to check if the triangle is valid.

    # Checking the type of triangle using conditional statements if it is valid:
    if side1 == side2 && side2 == side3
      :equilateral # If all sides are equal, it is an equilateral triangle.
    elsif side1 == side2 || side2 == side3 || side1 == side3
      :isosceles # If two sides are equal, it is an isosceles triangle.
    else
      :scalene # If all sides are different, it is a scalene triangle.
    end
  end

  private
  # The validate_triangle private method checks if the sum of any two sides is greater than the third side. If it is not, it raises a TriangleError.

  def validate_triangle
    # Checking: If any side is less than or equal to 0, we raise a TriangleError custom error with a specific error message.
    if @side1 <= 0 || @side2 <= 0 || @side3 <= 0
      raise TriangleError.new("Triangle sides must be greater than 0")
    # Checking: If the sum of any two sides is less than or equal to the third side, we raise a TriangleError custom error with a specific error message.
    elsif (@side1 + @side2 <= @side3) || (@side2 + @side3 <= @side1) || (@side1 + @side3 <= @side2)
      raise TriangleError.new("Invalid trianle sides")
    end
  end

  class TriangleError < StandardError; end
end
# triangle = Triangle.new(3, 4, 5)
# puts triangle.side1 # output: 3
# puts triangle.side2 # output: 4
# puts triangle.side3 # output: 5

# triangle.side1 = 6
# puts triangle.side1 # output: 6
