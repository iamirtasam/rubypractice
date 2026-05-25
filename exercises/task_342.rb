# Practice: Exception Handling and Custom Errors

class GamePlayerError < StandardError
  def initialize(msg = "invalid category output")
    super
  end
end

class GamePlayer
  MIN_OUTPUT = 2
  MAX_OUTPUT = 103

  def initialize(category)
    @category = category
    @output = 0
  end

  def set_output(val)
    raise ArgumentError, "output must be a number" unless val.is_a?(Numeric)
    raise GamePlayerError, "output \#{val} out of [2,103] range" unless (2..103).include?(val)
    @output = val
  end

  def output
    raise GamePlayerError, "output not set" if @output.zero?
    @output
  end
end

test_values = [14, -2, 116, 58]

obj = GamePlayer.new("category_test")
test_values.each do |val|
  begin
    obj.set_output(val)
    puts "Set output = \#{val} => OK (stored: \#{obj.output})"
  rescue GamePlayerError => e
    puts "[GamePlayerError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
