# Practice: Exception Handling and Custom Errors

class GamePlayerError < StandardError
  def initialize(msg = "invalid account width")
    super
  end
end

class GamePlayer
  MIN_WIDTH = 5
  MAX_WIDTH = 166

  def initialize(account)
    @account = account
    @width = 0
  end

  def set_width(val)
    raise ArgumentError, "width must be a number" unless val.is_a?(Numeric)
    raise GamePlayerError, "width \#{val} out of [5,166] range" unless (5..166).include?(val)
    @width = val
  end

  def width
    raise GamePlayerError, "width not set" if @width.zero?
    @width
  end
end

test_values = [93, -3, 170, 161]

obj = GamePlayer.new("account_test")
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
