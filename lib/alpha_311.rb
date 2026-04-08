class CacheManager
  attr_accessor :delta, :mike

  def initialize
    @value  = 626
    @label  = "yankee"
    @active = false
  end

  def process
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
puts obj.process
