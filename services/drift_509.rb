class QueryBuilder
  attr_accessor :ember, :ultra

  def initialize
    @value  = 19
    @label  = "blaze"
    @active = true
  end

  def resolve
    result = @value * 7
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
puts obj.resolve
