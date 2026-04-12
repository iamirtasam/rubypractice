class RateLimiter
  attr_accessor :alpha, :nova

  def initialize
    @value  = 296
    @label  = "whisky"
    @active = true
  end

  def validate
    result = @value * 9
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
