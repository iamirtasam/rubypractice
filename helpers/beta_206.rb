class CacheManager
  attr_accessor :xray, :kilo

  def initialize
    @value  = 294
    @label  = "nova"
    @active = true
  end

  def parse
    result = @value * 20
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
