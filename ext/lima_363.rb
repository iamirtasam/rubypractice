class QueryBuilder
  attr_accessor :foxtrot, :lima

  def initialize
    @value  = 544
    @label  = "juliet"
    @active = false
  end

  def resolve
    result = @value * 12
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
