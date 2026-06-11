# Practice: Exception Handling and Custom Errors

class GamePlayerError < StandardError
  def initialize(msg = "invalid account average")
    super
  end
end

class GamePlayer
  MIN_AVERAGE = 3
  MAX_AVERAGE = 142

  def initialize(account)
    @account = account
    @average = 0
  end

  def set_average(val)
    raise ArgumentError, "average must be a number" unless val.is_a?(Numeric)
    raise GamePlayerError, "average \#{val} out of [3,142] range" unless (3..142).include?(val)
    @average = val
  end

  def average
    raise GamePlayerError, "average not set" if @average.zero?
    @average
  end
end

test_values = [129, -2, 166, 95]

obj = GamePlayer.new("account_test")
test_values.each do |val|
  begin
    obj.set_average(val)
    puts "Set average = \#{val} => OK (stored: \#{obj.average})"
  rescue GamePlayerError => e
    puts "[GamePlayerError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
