# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid account limit")
    super
  end
end

class Library
  MIN_LIMIT = 1
  MAX_LIMIT = 168

  def initialize(account)
    @account = account
    @limit = 0
  end

  def set_limit(val)
    raise ArgumentError, "limit must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "limit \#{val} out of [1,168] range" unless (1..168).include?(val)
    @limit = val
  end

  def limit
    raise LibraryError, "limit not set" if @limit.zero?
    @limit
  end
end

test_values = [135, -1, 202, 159]

obj = Library.new("account_test")
test_values.each do |val|
  begin
    obj.set_limit(val)
    puts "Set limit = \#{val} => OK (stored: \#{obj.limit})"
  rescue LibraryError => e
    puts "[LibraryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
