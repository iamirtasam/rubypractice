class CacheManager
  attr_accessor :mike, :victor

  def initialize
    @value  = 925
    @label  = "delta"
    @active = true
  end

  def resolve
    result = @value * 18
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
puts obj.resolve
