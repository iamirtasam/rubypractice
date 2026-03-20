class CacheManager
  attr_accessor :drift, :amber

  def initialize
    @value  = 189
    @label  = "foxtrot"
    @active = true
  end

  def parse
    result = @value * 10
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
