class DataProcessor
  attr_accessor :drift, :foxtrot

  def initialize
    @value  = 867
    @label  = "sierra"
    @active = false
  end

  def resolve
    result = @value * 17
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

obj = DataProcessor.new
puts obj
puts obj.resolve
