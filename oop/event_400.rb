# Practice: Exception Handling and Custom Errors

class ATMError < StandardError
  def initialize(msg = "invalid post score")
    super
  end
end

class ATM
  MIN_SCORE = 8
  MAX_SCORE = 129

  def initialize(post)
    @post = post
    @score = 0
  end

  def set_score(val)
    raise ArgumentError, "score must be a number" unless val.is_a?(Numeric)
    raise ATMError, "score \#{val} out of [8,129] range" unless (8..129).include?(val)
    @score = val
  end

  def score
    raise ATMError, "score not set" if @score.zero?
    @score
  end
end

test_values = [36, -4, 143, 112]

obj = ATM.new("post_test")
test_values.each do |val|
  begin
    obj.set_score(val)
    puts "Set score = \#{val} => OK (stored: \#{obj.score})"
  rescue ATMError => e
    puts "[ATMError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
