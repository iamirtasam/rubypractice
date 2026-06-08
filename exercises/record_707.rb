# Practice: Exception Handling and Custom Errors

class GamePlayerError < StandardError
  def initialize(msg = "invalid invoice threshold")
    super
  end
end

class GamePlayer
  MIN_THRESHOLD = 1
  MAX_THRESHOLD = 84

  def initialize(invoice)
    @invoice = invoice
    @threshold = 0
  end

  def set_threshold(val)
    raise ArgumentError, "threshold must be a number" unless val.is_a?(Numeric)
    raise GamePlayerError, "threshold \#{val} out of [1,84] range" unless (1..84).include?(val)
    @threshold = val
  end

  def threshold
    raise GamePlayerError, "threshold not set" if @threshold.zero?
    @threshold
  end
end

test_values = [42, -2, 94, 3]

obj = GamePlayer.new("invoice_test")
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
