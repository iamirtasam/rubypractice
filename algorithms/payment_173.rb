# Practice: Exception Handling and Custom Errors

class GamePlayerError < StandardError
  def initialize(msg = "invalid review speed")
    super
  end
end

class GamePlayer
  MIN_SPEED = 6
  MAX_SPEED = 59

  def initialize(review)
    @review = review
    @speed = 0
  end

  def set_speed(val)
    raise ArgumentError, "speed must be a number" unless val.is_a?(Numeric)
    raise GamePlayerError, "speed \#{val} out of [6,59] range" unless (6..59).include?(val)
    @speed = val
  end

  def speed
    raise GamePlayerError, "speed not set" if @speed.zero?
    @speed
  end
end

test_values = [52, -5, 102, 25]

obj = GamePlayer.new("review_test")
test_values.each do |val|
  begin
    obj.set_speed(val)
    puts "Set speed = \#{val} => OK (stored: \#{obj.speed})"
  rescue GamePlayerError => e
    puts "[GamePlayerError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
