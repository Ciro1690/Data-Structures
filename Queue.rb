class Queue

    attr_reader :queue

    def initialize
        @queue = []
    end

    def enqueue(el)
        queue.push(el)
    end
    
    def dequeue
        queue.shift
    end
    
    def peek   
        queue[0]   
    end
end

q = Queue.new
p q.enqueue(3)
p q.enqueue(4)
p q.dequeue
p q.peek