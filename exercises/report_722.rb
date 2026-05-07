# Practice: Exception Handling and Custom Errors

class GamePlayerError < StandardError
  def initialize(msg = "invalid session threshold")
    super
  end
end

class GamePlayer
  MIN_THRESHOLD = 6
  MAX_THRESHOLD = 138

  def initialize(session)
    @session = session
    @threshold = 0
  end

  def set_threshold(val)
    raise ArgumentError, "threshold must be a number" unless val.is_a?(Numeric)
    raise GamePlayerError, "threshold \#{val} out of [6,138] range" unless (6..138).include?(val)
    @threshold = val
  end

  def threshold
    raise GamePlayerError, "threshold not set" if @threshold.zero?
    @threshold
  end
end

test_values = [11, -4, 188, 13]

obj = GamePlayer.new("session_test")
test_values.each do |val|
  begin
    obj.set_threshold(val)
    puts "Set threshold = \#{val} => OK (stored: \#{obj.threshold})"
  rescue GamePlayerError => e
    puts "[GamePlayerError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
