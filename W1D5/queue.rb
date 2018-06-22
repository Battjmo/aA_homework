class Queue

  attr_accessor :queue

  def initialize
    @queue = Array.new
  end

  def enQ(el)
    queue.push(el)
  end

  def deQ
    queue.shift
  end

  def peek
    queue[0]
  end

end
