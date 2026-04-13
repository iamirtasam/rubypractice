class QueryBuilder
  attr_accessor :frost, :whisky

  def initialize
    @value  = 780
    @label  = "blaze"
    @active = true
  end

  def transform
    result = @value * 14
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
