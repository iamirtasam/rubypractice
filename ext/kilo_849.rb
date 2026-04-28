class FileHandler
  attr_accessor :yankee, :beta

  def initialize
    @value  = 925
    @label  = "whisky"
    @active = true
  end

  def serialize
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

obj = FileHandler.new
puts obj
puts obj.serialize
