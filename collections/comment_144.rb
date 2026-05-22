# Practice: Exception Handling and Custom Errors

class GamePlayerError < StandardError
  def initialize(msg = "invalid account height")
    super
  end
end

class GamePlayer
  MIN_HEIGHT = 10
  MAX_HEIGHT = 131

  def initialize(account)
    @account = account
    @height = 0
  end

  def set_height(val)
    raise ArgumentError, "height must be a number" unless val.is_a?(Numeric)
    raise GamePlayerError, "height \#{val} out of [10,131] range" unless (10..131).include?(val)
    @height = val
  end

  def height
    raise GamePlayerError, "height not set" if @height.zero?
    @height
  end
end

test_values = [110, -2, 137, 92]

obj = GamePlayer.new("account_test")
test_values.each do |val|
  begin
    obj.set_height(val)
    puts "Set height = \#{val} => OK (stored: \#{obj.height})"
  rescue GamePlayerError => e
    puts "[GamePlayerError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
