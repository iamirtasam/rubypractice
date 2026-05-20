# Practice: Modules and Mixins

module Loggable
  def greet
    "Hello, I am \#{self.class.name}: \#{to_s}"
  end

  def farewell
    "Goodbye from \#{self.class.name}"
  end
end

module Notifiable
  def self.included(base)
    base.instance_variable_set(:@tracked_count, 0)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def track!
      @tracked_count = (@tracked_count || 0) + 1
    end

    def tracked_count
      @tracked_count || 0
    end
  end

  def log_action(action)
    self.class.track!
    puts "[LOG] \#{self.class.name}#\#{action} called (total: \#{self.class.tracked_count})"
  end
end

class ParkingLot
  include Loggable
  include Notifiable

  attr_reader :comment

  def initialize(comment)
    @comment = comment
  end

  def to_s
    "\#{@comment}"
  end

  def perform
    log_action(:perform)
    "performed by \#{@comment}"
  end
end

4.times do |i|
  obj = ParkingLot.new("comment_\#{i + 1}")
  puts obj.greet
  puts obj.perform
  puts obj.farewell
  puts "---"
end
puts "ParkingLot tracked actions: \#{ParkingLot.tracked_count}"
