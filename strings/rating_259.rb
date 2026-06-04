# Practice: Exception Handling and Custom Errors

class GamePlayerError < StandardError
  def initialize(msg = "invalid review offset")
    super
  end
end

class GamePlayer
  MIN_OFFSET = 4
  MAX_OFFSET = 79

  def initialize(review)
    @review = review
    @offset = 0
  end

  def set_offset(val)
    raise ArgumentError, "offset must be a number" unless val.is_a?(Numeric)
    raise GamePlayerError, "offset \#{val} out of [4,79] range" unless (4..79).include?(val)
    @offset = val
  end

  def offset
    raise GamePlayerError, "offset not set" if @offset.zero?
    @offset
  end
end

test_values = [35, -2, 99, 22]

obj = GamePlayer.new("review_test")
test_values.each do |val|
  begin
    obj.set_offset(val)
    puts "Set offset = \#{val} => OK (stored: \#{obj.offset})"
  rescue GamePlayerError => e
    puts "[GamePlayerError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
