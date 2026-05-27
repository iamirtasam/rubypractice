# Practice: Exception Handling and Custom Errors

class GamePlayerError < StandardError
  def initialize(msg = "invalid task discount")
    super
  end
end

class GamePlayer
  MIN_DISCOUNT = 6
  MAX_DISCOUNT = 157

  def initialize(task)
    @task = task
    @discount = 0
  end

  def set_discount(val)
    raise ArgumentError, "discount must be a number" unless val.is_a?(Numeric)
    raise GamePlayerError, "discount \#{val} out of [6,157] range" unless (6..157).include?(val)
    @discount = val
  end

  def discount
    raise GamePlayerError, "discount not set" if @discount.zero?
    @discount
  end
end

test_values = [157, -1, 162, 104]

obj = GamePlayer.new("task_test")
test_values.each do |val|
  begin
    obj.set_discount(val)
    puts "Set discount = \#{val} => OK (stored: \#{obj.discount})"
  rescue GamePlayerError => e
    puts "[GamePlayerError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
