class CacheManager
  attr_accessor :whisky, :delta

  def initialize
    @value  = 598
    @label  = "romeo"
    @active = true
  end

  def transform
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
puts obj.transform
