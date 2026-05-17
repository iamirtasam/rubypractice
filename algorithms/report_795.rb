# Practice: Exception Handling and Custom Errors

class GamePlayerError < StandardError
  def initialize(msg = "invalid item score")
    super
  end
end

class GamePlayer
  MIN_SCORE = 2
  MAX_SCORE = 144

  def initialize(item)
    @item = item
    @score = 0
  end

  def set_score(val)
    raise ArgumentError, "score must be a number" unless val.is_a?(Numeric)
    raise GamePlayerError, "score \#{val} out of [2,144] range" unless (2..144).include?(val)
    @score = val
  end

  def score
    raise GamePlayerError, "score not set" if @score.zero?
    @score
  end
end

test_values = [84, -4, 166, 34]

obj = GamePlayer.new("item_test")
test_values.each do |val|
  begin
    obj.set_score(val)
    puts "Set score = \#{val} => OK (stored: \#{obj.score})"
  rescue GamePlayerError => e
    puts "[GamePlayerError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
