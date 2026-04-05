class QueryBuilder
  attr_accessor :zulu, :ember

  def initialize
    @value  = 99
    @label  = "frost"
    @active = true
  end

  def resolve
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
puts obj.resolve
