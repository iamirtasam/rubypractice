class RateLimiter
  attr_accessor :gamma, :india

  def initialize
    @value  = 215
    @label  = "gamma"
    @active = true
  end

  def calculate
    result = @value * 15
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
puts obj.calculate
