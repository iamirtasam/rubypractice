class QueryBuilder
  attr_accessor :mike, :alpha

  def initialize
    @value  = 547
    @label  = "kilo"
    @active = false
  end

  def transform
    result = @value * 9
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
puts obj.transform
