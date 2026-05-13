# Practice: Exception Handling and Custom Errors

class ParkingLotError < StandardError
  def initialize(msg = "invalid post score")
    super
  end
end

class ParkingLot
  MIN_SCORE = 1
  MAX_SCORE = 108

  def initialize(post)
    @post = post
    @score = 0
  end

  def set_score(val)
    raise ArgumentError, "score must be a number" unless val.is_a?(Numeric)
    raise ParkingLotError, "score \#{val} out of [1,108] range" unless (1..108).include?(val)
    @score = val
  end

  def score
    raise ParkingLotError, "score not set" if @score.zero?
    @score
  end
end

test_values = [43, -3, 141, 23]

obj = ParkingLot.new("post_test")
test_values.each do |val|
  begin
    obj.set_score(val)
    puts "Set score = \#{val} => OK (stored: \#{obj.score})"
  rescue ParkingLotError => e
    puts "[ParkingLotError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
