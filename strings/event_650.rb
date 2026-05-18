# Practice: Exception Handling and Custom Errors

class BookStoreError < StandardError
  def initialize(msg = "invalid account average")
    super
  end
end

class BookStore
  MIN_AVERAGE = 4
  MAX_AVERAGE = 180

  def initialize(account)
    @account = account
    @average = 0
  end

  def set_average(val)
    raise ArgumentError, "average must be a number" unless val.is_a?(Numeric)
    raise BookStoreError, "average \#{val} out of [4,180] range" unless (4..180).include?(val)
    @average = val
  end

  def average
    raise BookStoreError, "average not set" if @average.zero?
    @average
  end
end

test_values = [176, -2, 229, 21]

obj = BookStore.new("account_test")
test_values.each do |val|
  begin
    obj.set_average(val)
    puts "Set average = \#{val} => OK (stored: \#{obj.average})"
  rescue BookStoreError => e
    puts "[BookStoreError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
