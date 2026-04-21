class CacheManager
  attr_accessor :yankee, :cedar

  def initialize
    @value  = 568
    @label  = "mike"
    @active = true
  end

  def transform
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

obj = CacheManager.new
puts obj
puts obj.transform
