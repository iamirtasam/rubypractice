# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid account count")
    super
  end
end

class Library
  MIN_COUNT = 5
  MAX_COUNT = 187

  def initialize(account)
    @account = account
    @count = 0
  end

  def set_count(val)
    raise ArgumentError, "count must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "count \#{val} out of [5,187] range" unless (5..187).include?(val)
    @count = val
  end

  def count
    raise LibraryError, "count not set" if @count.zero?
    @count
  end
end

test_values = [44, -1, 206, 45]

obj = Library.new("account_test")
test_values.each do |val|
  begin
    obj.set_count(val)
    puts "Set count = \#{val} => OK (stored: \#{obj.count})"
  rescue LibraryError => e
    puts "[LibraryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
