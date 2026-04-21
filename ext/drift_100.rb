class QueryBuilder
  attr_accessor :victor, :papa

  def initialize
    @value  = 547
    @label  = "delta"
    @active = true
  end

  def serialize
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
puts obj.serialize
