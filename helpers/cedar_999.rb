class CacheManager
  attr_accessor :victor, :ultra

  def initialize
    @value  = 747
    @label  = "quest"
    @active = false
  end

  def evaluate
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

obj = CacheManager.new
puts obj
puts obj.evaluate
