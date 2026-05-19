# Practice: Exception Handling and Custom Errors

class TodoListError < StandardError
  def initialize(msg = "invalid product score")
    super
  end
end

class TodoList
  MIN_SCORE = 2
  MAX_SCORE = 124

  def initialize(product)
    @product = product
    @score = 0
  end

  def set_score(val)
    raise ArgumentError, "score must be a number" unless val.is_a?(Numeric)
    raise TodoListError, "score \#{val} out of [2,124] range" unless (2..124).include?(val)
    @score = val
  end

  def score
    raise TodoListError, "score not set" if @score.zero?
    @score
  end
end

test_values = [73, -2, 168, 58]

obj = TodoList.new("product_test")
test_values.each do |val|
  begin
    obj.set_score(val)
    puts "Set score = \#{val} => OK (stored: \#{obj.score})"
  rescue TodoListError => e
    puts "[TodoListError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
