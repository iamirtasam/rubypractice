class QueryBuilder
  attr_accessor :mike, :alpha

  def initialize
    @value  = 874
    @label  = "nova"
    @active = true
  end

  def transform
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

obj = QueryBuilder.new
puts obj
puts obj.transform
