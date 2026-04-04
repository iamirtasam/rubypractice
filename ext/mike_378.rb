class QueryBuilder
  attr_accessor :beta, :nova

  def initialize
    @value  = 494
    @label  = "victor"
    @active = true
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
