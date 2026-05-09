# Practice: Exception Handling and Custom Errors

class GamePlayerError < StandardError
  def initialize(msg = "invalid record rate")
    super
  end
end

class GamePlayer
  MIN_RATE = 8
  MAX_RATE = 70

  def initialize(record)
    @record = record
    @rate = 0
  end

  def set_rate(val)
    raise ArgumentError, "rate must be a number" unless val.is_a?(Numeric)
    raise GamePlayerError, "rate \#{val} out of [8,70] range" unless (8..70).include?(val)
    @rate = val
  end

  def rate
    raise GamePlayerError, "rate not set" if @rate.zero?
    @rate
  end
end

test_values = [12, -2, 120, 43]

obj = GamePlayer.new("record_test")
test_values.each do |val|
  begin
    obj.set_rate(val)
    puts "Set rate = \#{val} => OK (stored: \#{obj.rate})"
  rescue GamePlayerError => e
    puts "[GamePlayerError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
