class RateLimiter
  attr_accessor :frost, :romeo

  def initialize
    @value  = 14
    @label  = "romeo"
    @active = true
  end

  def parse
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
puts obj.parse
