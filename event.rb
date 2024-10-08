class Event
  attr_accessor :name, :date, :hour, :category, :queue

  def initialize(name, date, hour, category)
    @name = name
    @date = date
    @hour = hour
    @category = category
    @queue = LinkedList.new
  end

  def add_to_queue(customer, has_priority = false)
    if has_priority
      @queue.prepend(customer)
    else
      @queue.append(customer)
    end
  end

  def process_queue
    customer = @queue.pop
    if customer
      puts "Processing ticket for #{customer.name}"
    else
      puts "Queue is empty"
    end
    customer
  end
end
