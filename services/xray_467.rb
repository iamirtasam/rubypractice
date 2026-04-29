class CacheManager
  attr_accessor :zulu, :ultra

  def initialize
    @value  = 625
    @label  = "ultra"
    @active = true
  end

  def process
    result = @value * 8
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
