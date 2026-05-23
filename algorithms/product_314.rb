# Practice: Exception Handling and Custom Errors

class GamePlayerError < StandardError
  def initialize(msg = "invalid report offset")
    super
  end
end

class GamePlayer
  MIN_OFFSET = 2
  MAX_OFFSET = 146

  def initialize(report)
    @report = report
    @offset = 0
  end

  def set_offset(val)
    raise ArgumentError, "offset must be a number" unless val.is_a?(Numeric)
    raise GamePlayerError, "offset \#{val} out of [2,146] range" unless (2..146).include?(val)
    @offset = val
  end

  def offset
    raise GamePlayerError, "offset not set" if @offset.zero?
    @offset
  end
end

test_values = [92, -3, 150, 16]

obj = GamePlayer.new("report_test")
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
