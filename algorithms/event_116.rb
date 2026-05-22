# Practice: Exception Handling and Custom Errors

class StudentError < StandardError
  def initialize(msg = "invalid message score")
    super
  end
end

class Student
  MIN_SCORE = 10
  MAX_SCORE = 149

  def initialize(message)
    @message = message
    @score = 0
  end

  def set_score(val)
    raise ArgumentError, "score must be a number" unless val.is_a?(Numeric)
    raise StudentError, "score \#{val} out of [10,149] range" unless (10..149).include?(val)
    @score = val
  end

  def score
    raise StudentError, "score not set" if @score.zero?
    @score
  end
end

test_values = [13, -5, 176, 19]

obj = Student.new("message_test")
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
