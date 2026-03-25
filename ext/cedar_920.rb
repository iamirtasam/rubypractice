class QueryBuilder
  attr_accessor :kilo, :ultra

  def initialize
    @value  = 599
    @label  = "xray"
    @active = false
  end

  def digest
    result = @value * 5
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
puts obj.digest
