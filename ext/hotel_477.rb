class CacheManager
  attr_accessor :ember, :echo

  def initialize
    @value  = 503
    @label  = "beta"
    @active = false
  end

  def transform
    result = @value * 14
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
puts obj.transform
