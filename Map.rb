class Map

    attr_reader :underlying_array

    def initialize
        @underlying_array = []
    end

  def set(key, value)
    pair_index = underlying_array.index { |pair| pair[0] == key }
    if pair_index
      underlying_array[pair_index][1] = value
    else
      underlying_array.push([key, value])
    end
    value
  end
    
    def get(key)
        underlying_array.each do |pairs|
            if key == pairs[0]
                return pairs[1]
            end
        end
    end
    
    def delete(key)
        underlying_array.each do |pairs|
            if key == pairs[0]
                underlying_array.delete(pairs)
            end
        end
    end
    
    def show
        deep_dup(underlying_array)
    end

    def deep_dup(array)
        array.map {|el| el.is_a?(Array) ? deep_dup(el) : el}
    end
end

m = Map.new
m.set('A', 1)
m.set('B', 2)
m.set('C', 3)
m.set('A', 4)
p m.get('A')
p m.delete('A')
p m.show