class MathDojo
  def initialize
    @sum = 0
  end

  def add(*nums)
    nums.flatten.each { |i| @sum += i }
    self
  end

  def subtract(*nums)
    nums.flatten.each { |i| @sum -= i }
    self
  end

  def result
    puts @sum
    self
  end
end

c1 = MathDojo.new.add([1, 2, 3], 4).add(2, 2).subtract(10).result
