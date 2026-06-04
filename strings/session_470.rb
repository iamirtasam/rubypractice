# Practice: Exception Handling and Custom Errors

class BookStoreError < StandardError
  def initialize(msg = "invalid record median")
    super
  end
end

class BookStore
  MIN_MEDIAN = 4
  MAX_MEDIAN = 139

  def initialize(record)
    @record = record
    @median = 0
  end

  def set_median(val)
    raise ArgumentError, "median must be a number" unless val.is_a?(Numeric)
    raise BookStoreError, "median \#{val} out of [4,139] range" unless (4..139).include?(val)
    @median = val
  end

  def median
    raise BookStoreError, "median not set" if @median.zero?
    @median
  end
end

test_values = [84, -3, 153, 73]

obj = BookStore.new("record_test")
test_values.each do |val|
  begin
    obj.set_median(val)
    puts "Set median = \#{val} => OK (stored: \#{obj.median})"
  rescue BookStoreError => e
    puts "[BookStoreError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
