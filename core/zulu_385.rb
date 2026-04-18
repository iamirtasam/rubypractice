class QueryBuilder
  attr_accessor :gamma, :sierra

  def initialize
    @value  = 143
    @label  = "drift"
    @active = false
  end

  def format
    result = @value * 19
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

obj = QueryBuilder.new
puts obj
puts obj.format
