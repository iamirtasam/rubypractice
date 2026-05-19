# Practice: Exception Handling and Custom Errors

class GamePlayerError < StandardError
  def initialize(msg = "invalid comment width")
    super
  end
end

class GamePlayer
  MIN_WIDTH = 8
  MAX_WIDTH = 78

  def initialize(comment)
    @comment = comment
    @width = 0
  end

  def set_width(val)
    raise ArgumentError, "width must be a number" unless val.is_a?(Numeric)
    raise GamePlayerError, "width \#{val} out of [8,78] range" unless (8..78).include?(val)
    @width = val
  end

  def width
    raise GamePlayerError, "width not set" if @width.zero?
    @width
  end
end

test_values = [12, -2, 93, 23]

obj = GamePlayer.new("comment_test")
test_values.each do |val|
  begin
    obj.set_width(val)
    puts "Set width = \#{val} => OK (stored: \#{obj.width})"
  rescue GamePlayerError => e
    puts "[GamePlayerError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
