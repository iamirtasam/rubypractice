class QueryBuilder
  attr_accessor :juliet, :ember

  def initialize
    @value  = 702
    @label  = "hotel"
    @active = false
  end

  def compute
    result = @value * 11
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
puts obj.compute
