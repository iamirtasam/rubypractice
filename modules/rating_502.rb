# Practice: Exception Handling and Custom Errors

class BankAccountError < StandardError
  def initialize(msg = "invalid rating score")
    super
  end
end

class BankAccount
  MIN_SCORE = 9
  MAX_SCORE = 89

  def initialize(rating)
    @rating = rating
    @score = 0
  end

  def set_score(val)
    raise ArgumentError, "score must be a number" unless val.is_a?(Numeric)
    raise BankAccountError, "score \#{val} out of [9,89] range" unless (9..89).include?(val)
    @score = val
  end

  def score
    raise BankAccountError, "score not set" if @score.zero?
    @score
  end
end

test_values = [49, -2, 126, 9]

obj = BankAccount.new("rating_test")
test_values.each do |val|
  begin
    obj.set_score(val)
    puts "Set score = \#{val} => OK (stored: \#{obj.score})"
  rescue BankAccountError => e
    puts "[BankAccountError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
