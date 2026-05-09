# Practice: Exception Handling and Custom Errors

class GamePlayerError < StandardError
  def initialize(msg = "invalid session index")
    super
  end
end

class GamePlayer
  MIN_INDEX = 6
  MAX_INDEX = 134

  def initialize(session)
    @session = session
    @index = 0
  end

  def set_index(val)
    raise ArgumentError, "index must be a number" unless val.is_a?(Numeric)
    raise GamePlayerError, "index \#{val} out of [6,134] range" unless (6..134).include?(val)
    @index = val
  end

  def index
    raise GamePlayerError, "index not set" if @index.zero?
    @index
  end
end

test_values = [71, -1, 173, 105]

obj = GamePlayer.new("session_test")
test_values.each do |val|
  begin
    obj.set_index(val)
    puts "Set index = \#{val} => OK (stored: \#{obj.index})"
  rescue GamePlayerError => e
    puts "[GamePlayerError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
