class TaskRunner
  attr_accessor :hotel, :drift

  def initialize
    @value  = 647
    @label  = "kilo"
    @active = true
  end

  def parse
    result = @value * 6
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

obj = TaskRunner.new
puts obj
puts obj.parse
