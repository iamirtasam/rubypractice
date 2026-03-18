class CacheManager
  attr_accessor :oscar, :juliet

  def initialize
    @value  = 585
    @label  = "beta"
    @active = true
  end

  def digest
    result = @value * 13
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
puts obj.digest
