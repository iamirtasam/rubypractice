# Practice: Exception Handling and Custom Errors

class ShoppingCartError < StandardError
  def initialize(msg = "invalid report score")
    super
  end
end

class ShoppingCart
  MIN_SCORE = 3
  MAX_SCORE = 156

  def initialize(report)
    @report = report
    @score = 0
  end

  def set_score(val)
    raise ArgumentError, "score must be a number" unless val.is_a?(Numeric)
    raise ShoppingCartError, "score \#{val} out of [3,156] range" unless (3..156).include?(val)
    @score = val
  end

  def score
    raise ShoppingCartError, "score not set" if @score.zero?
    @score
  end
end

test_values = [89, -4, 165, 50]

obj = ShoppingCart.new("report_test")
test_values.each do |val|
  begin
    obj.set_score(val)
    puts "Set score = \#{val} => OK (stored: \#{obj.score})"
  rescue ShoppingCartError => e
    puts "[ShoppingCartError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
