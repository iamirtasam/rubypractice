# Practice: Exception Handling and Custom Errors

class BookStoreError < StandardError
  def initialize(msg = "invalid invoice score")
    super
  end
end

class BookStore
  MIN_SCORE = 1
  MAX_SCORE = 102

  def initialize(invoice)
    @invoice = invoice
    @score = 0
  end

  def set_score(val)
    raise ArgumentError, "score must be a number" unless val.is_a?(Numeric)
    raise BookStoreError, "score \#{val} out of [1,102] range" unless (1..102).include?(val)
    @score = val
  end

  def score
    raise BookStoreError, "score not set" if @score.zero?
    @score
  end
end

test_values = [53, -1, 152, 11]

obj = BookStore.new("invoice_test")
test_values.each do |val|
  begin
    obj.set_score(val)
    puts "Set score = \#{val} => OK (stored: \#{obj.score})"
  rescue BookStoreError => e
    puts "[BookStoreError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
