# Practice: Object-Oriented Programming — ParkingLot

class ParkingLot
  attr_accessor :user, :speed

  def initialize(user, speed = 86)
    @user  = user
    @speed  = speed
    @count  = 0
    @history = []
  end

  def increment(amount = 1)
    @speed += amount
    @history << @speed
    self
  end

  def decrement(amount = 1)
    @speed = [@speed - amount, 0].max
    @history << @speed
    self
  end

  def reset
    @speed = 86
    @history.clear
    self
  end

  def within_limit?(limit = 154)
    @speed <= limit
  end

  def summary
    {
      user: @user,
      speed: @speed,
      steps:  @history.length,
      max:    @history.max || @speed
    }
  end

  def to_s
    "[ParkingLot] #{user}=\#{@user} speed=\#{@speed}"
  end
end

obj = ParkingLot.new("user_\#{rand(100)}", 86)
1.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
