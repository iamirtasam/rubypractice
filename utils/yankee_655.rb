class RateLimiter
  attr_accessor :frost, :xray

  def initialize
    @value  = 685
    @label  = "whisky"
    @active = true
  end

  def evaluate
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
puts obj.evaluate
