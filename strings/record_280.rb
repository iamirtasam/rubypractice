# Practice: Exception Handling and Custom Errors

class TodoListError < StandardError
  def initialize(msg = "invalid item score")
    super
  end
end

class TodoList
  MIN_SCORE = 8
  MAX_SCORE = 137

  def initialize(item)
    @item = item
    @score = 0
  end

  def set_score(val)
    raise ArgumentError, "score must be a number" unless val.is_a?(Numeric)
    raise TodoListError, "score \#{val} out of [8,137] range" unless (8..137).include?(val)
    @score = val
  end

  def score
    raise TodoListError, "score not set" if @score.zero?
    @score
  end
end

test_values = [102, -2, 144, 132]

obj = TodoList.new("item_test")
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
