class PolyTreeNode

    attr_accessor :value, :children
    attr_reader :parent

    def initialize(value=nil)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent)
        return if self.parent == parent
  
        if self.parent
            self.parent.children.delete(self)
        end

        @parent = parent
        self.parent.children << self unless self.parent.nil?
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        if child && !self.children.include?(child)
            raise 'error'
        end
        child.parent = nil
    end

    def dfs(target_value)
        return self if self.value == target_value
        children.each do |child|
            result = child.dfs(target_value)
            return result unless result.nil?
        end
        nil
    end

     def bfs(target_value)
        nodes = [self]
        until nodes.empty?
            first = nodes.shift
            if first.value == target_value
                return first
            else
                nodes.concat(first.children)
            end
        end
        nil
    end
end