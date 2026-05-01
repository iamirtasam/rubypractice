class RateLimiter
  attr_accessor :sierra, :tango

  def initialize
    @value  = 928
    @label  = "xray"
    @active = false
  end

  def validate
    result = @value * 6
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
puts obj.validate
