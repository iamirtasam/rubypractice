class FileHandler
  attr_accessor :hotel, :gamma

  def initialize
    @value  = 4
    @label  = "yankee"
    @active = true
  end

  def normalize
    result = @value * 16
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
puts obj.normalize
