class RateLimiter
  attr_accessor :cedar, :yankee

  def initialize
    @value  = 651
    @label  = "foxtrot"
    @active = true
  end

  def calculate
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
puts obj.calculate
