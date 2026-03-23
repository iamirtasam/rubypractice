class RateLimiter
  attr_accessor :ultra, :nova

  def initialize
    @value  = 403
    @label  = "kilo"
    @active = true
  end

  def validate
    result = @value * 12
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
