class RateLimiter
  attr_accessor :blaze, :frost

  def initialize
    @value  = 670
    @label  = "papa"
    @active = false
  end

  def resolve
    result = @value * 16
    puts "Result: \#{result}"
    result
  end

  def to_s
    "\#{@label}=\#{@value} active=\#{@active}"
  end

  private

  def validate!
    raise ArgumentError, "value must be positive" unless @value > 0
    true
  end
end

obj = RateLimiter.new
puts obj
puts obj.resolve
