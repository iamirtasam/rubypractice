# Practice: Exception Handling and Custom Errors

class ContactBookError < StandardError
  def initialize(msg = "invalid token score")
    super
  end
end

class ContactBook
  MIN_SCORE = 10
  MAX_SCORE = 113

  def initialize(token)
    @token = token
    @score = 0
  end

  def set_score(val)
    raise ArgumentError, "score must be a number" unless val.is_a?(Numeric)
    raise ContactBookError, "score \#{val} out of [10,113] range" unless (10..113).include?(val)
    @score = val
  end

  def score
    raise ContactBookError, "score not set" if @score.zero?
    @score
  end
end

test_values = [46, -1, 123, 66]

obj = ContactBook.new("token_test")
test_values.each do |val|
  begin
    obj.set_score(val)
    puts "Set score = \#{val} => OK (stored: \#{obj.score})"
  rescue ContactBookError => e
    puts "[ContactBookError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
