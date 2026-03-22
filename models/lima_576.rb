class CacheManager
  attr_accessor :drift, :papa

  def initialize
    @value  = 301
    @label  = "drift"
    @active = false
  end

  def calculate
    result = @value * 8
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

obj = CacheManager.new
puts obj
puts obj.calculate
