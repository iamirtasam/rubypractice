# Practice: Exception Handling and Custom Errors

class BookStoreError < StandardError
  def initialize(msg = "invalid record average")
    super
  end
end

class BookStore
  MIN_AVERAGE = 6
  MAX_AVERAGE = 157

  def initialize(record)
    @record = record
    @average = 0
  end

  def set_average(val)
    raise ArgumentError, "average must be a number" unless val.is_a?(Numeric)
    raise BookStoreError, "average \#{val} out of [6,157] range" unless (6..157).include?(val)
    @average = val
  end

  def average
    raise BookStoreError, "average not set" if @average.zero?
    @average
  end
end

test_values = [115, -5, 170, 50]

obj = BookStore.new("record_test")
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
