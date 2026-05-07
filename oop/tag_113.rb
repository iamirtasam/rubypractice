# Practice: Exception Handling and Custom Errors

class StudentError < StandardError
  def initialize(msg = "invalid category score")
    super
  end
end

class Student
  MIN_SCORE = 1
  MAX_SCORE = 110

  def initialize(category)
    @category = category
    @score = 0
  end

  def set_score(val)
    raise ArgumentError, "score must be a number" unless val.is_a?(Numeric)
    raise StudentError, "score \#{val} out of [1,110] range" unless (1..110).include?(val)
    @score = val
  end

  def score
    raise StudentError, "score not set" if @score.zero?
    @score
  end
end

test_values = [25, -5, 127, 1]

obj = Student.new("category_test")
test_values.each do |val|
  begin
    obj.set_score(val)
    puts "Set score = \#{val} => OK (stored: \#{obj.score})"
  rescue StudentError => e
    puts "[StudentError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
