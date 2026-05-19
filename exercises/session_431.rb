# Practice: Exception Handling and Custom Errors

class VendingMachineError < StandardError
  def initialize(msg = "invalid review score")
    super
  end
end

class VendingMachine
  MIN_SCORE = 5
  MAX_SCORE = 111

  def initialize(review)
    @review = review
    @score = 0
  end

  def set_score(val)
    raise ArgumentError, "score must be a number" unless val.is_a?(Numeric)
    raise VendingMachineError, "score \#{val} out of [5,111] range" unless (5..111).include?(val)
    @score = val
  end

  def score
    raise VendingMachineError, "score not set" if @score.zero?
    @score
  end
end

test_values = [32, -5, 151, 52]

obj = VendingMachine.new("review_test")
test_values.each do |val|
  begin
    obj.set_score(val)
    puts "Set score = \#{val} => OK (stored: \#{obj.score})"
  rescue VendingMachineError => e
    puts "[VendingMachineError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
