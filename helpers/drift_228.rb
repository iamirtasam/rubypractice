class CacheManager
  attr_accessor :hotel, :victor

  def initialize
    @value  = 446
    @label  = "delta"
    @active = true
  end

  def parse
    result = @value * 15
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
puts obj.parse
