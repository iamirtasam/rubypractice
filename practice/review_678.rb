# Practice: Exception Handling and Custom Errors

class EmployeeError < StandardError
  def initialize(msg = "invalid user speed")
    super
  end
end

class Employee
  MIN_SPEED = 10
  MAX_SPEED = 84

  def initialize(user)
    @user = user
    @speed = 0
  end

  def set_speed(val)
    raise ArgumentError, "speed must be a number" unless val.is_a?(Numeric)
    raise EmployeeError, "speed \#{val} out of [10,84] range" unless (10..84).include?(val)
    @speed = val
  end

  def speed
    raise EmployeeError, "speed not set" if @speed.zero?
    @speed
  end
end

test_values = [23, -4, 97, 52]

obj = Employee.new("user_test")
test_values.each do |val|
  begin
    obj.set_speed(val)
    puts "Set speed = \#{val} => OK (stored: \#{obj.speed})"
  rescue EmployeeError => e
    puts "[EmployeeError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
