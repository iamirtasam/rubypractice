class RateLimiter
  attr_accessor :ultra, :whisky

  def initialize
    @value  = 882
    @label  = "whisky"
    @active = true
  end

  def transform
    result = @value * 11
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
puts obj.transform
