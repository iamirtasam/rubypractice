# Practice: Modules and Mixins

module Greetable
  def greet
    "Hello, I am \#{self.class.name}: \#{to_s}"
  end

  def farewell
    "Goodbye from \#{self.class.name}"
  end
end

module Cacheable
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

class BookStore
  include Greetable
  include Cacheable

  attr_reader :rating

  def initialize(rating)
    @rating = rating
  end

  def to_s
    "\#{@rating}"
  end

  def perform
    log_action(:perform)
    "performed by \#{@rating}"
  end
end

4.times do |i|
  obj = BookStore.new("rating_\#{i + 1}")
  puts obj.greet
  puts obj.perform
  puts obj.farewell
  puts "---"
end
puts "BookStore tracked actions: \#{BookStore.tracked_count}"
