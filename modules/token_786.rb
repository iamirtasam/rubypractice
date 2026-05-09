# Practice: Modules and Mixins

module Greetable
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

class Employee
  include Greetable
  include Notifiable

  attr_reader :item

  def initialize(item)
    @item = item
  end

  def to_s
    "\#{@item}"
  end

  def perform
    log_action(:perform)
    "performed by \#{@item}"
  end
end

3.times do |i|
  obj = Employee.new("item_\#{i + 1}")
  puts obj.greet
  puts obj.perform
  puts obj.farewell
  puts "---"
end
puts "Employee tracked actions: \#{Employee.tracked_count}"
