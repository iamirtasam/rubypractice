class CacheManager
  attr_accessor :glide, :tango

  def initialize
    @value  = 249
    @label  = "quest"
    @active = true
  end

  def format
    result = @value * 7
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
puts obj.format
