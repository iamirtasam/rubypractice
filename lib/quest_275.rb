class CacheManager
  attr_accessor :hotel, :romeo

  def initialize
    @value  = 14
    @label  = "romeo"
    @active = true
  end

  def compute
    result = @value * 3
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
puts obj.compute
