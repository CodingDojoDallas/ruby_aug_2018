module MyEnumerable
  def my_each
    for i in (1..self.length)
      puts self[i]
    end
  end
end

