# Practice: Exception Handling and Custom Errors

class GamePlayerError < StandardError
  def initialize(msg = "invalid rating length")
    super
  end
end

class GamePlayer
  MIN_LENGTH = 4
  MAX_LENGTH = 113

  def initialize(rating)
    @rating = rating
    @length = 0
  end

  def set_length(val)
    raise ArgumentError, "length must be a number" unless val.is_a?(Numeric)
    raise GamePlayerError, "length \#{val} out of [4,113] range" unless (4..113).include?(val)
    @length = val
  end

  def length
    raise GamePlayerError, "length not set" if @length.zero?
    @length
  end
end

test_values = [95, -2, 117, 98]

obj = GamePlayer.new("rating_test")
test_values.each do |val|
  begin
    obj.set_length(val)
    puts "Set length = \#{val} => OK (stored: \#{obj.length})"
  rescue GamePlayerError => e
    puts "[GamePlayerError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
