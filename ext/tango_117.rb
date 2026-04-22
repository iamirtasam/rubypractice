class QueryBuilder
  attr_accessor :glide, :cedar

  def initialize
    @value  = 806
    @label  = "tango"
    @active = false
  end

  def validate
    result = @value * 4
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
puts obj.validate
