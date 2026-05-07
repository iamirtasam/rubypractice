# Practice: Exception Handling and Custom Errors

class GamePlayerError < StandardError
  def initialize(msg = "invalid item ratio")
    super
  end
end

class GamePlayer
  MIN_RATIO = 3
  MAX_RATIO = 165

  def initialize(item)
    @item = item
    @ratio = 0
  end

  def set_ratio(val)
    raise ArgumentError, "ratio must be a number" unless val.is_a?(Numeric)
    raise GamePlayerError, "ratio \#{val} out of [3,165] range" unless (3..165).include?(val)
    @ratio = val
  end

  def ratio
    raise GamePlayerError, "ratio not set" if @ratio.zero?
    @ratio
  end
end

test_values = [144, -5, 170, 57]

obj = GamePlayer.new("item_test")
test_values.each do |val|
  begin
    obj.set_ratio(val)
    puts "Set ratio = \#{val} => OK (stored: \#{obj.ratio})"
  rescue GamePlayerError => e
    puts "[GamePlayerError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
