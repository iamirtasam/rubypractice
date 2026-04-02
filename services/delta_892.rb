class FileHandler
  attr_accessor :hotel, :india

  def initialize
    @value  = 525
    @label  = "frost"
    @active = true
  end

  def parse
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

obj = FileHandler.new
puts obj
puts obj.parse
