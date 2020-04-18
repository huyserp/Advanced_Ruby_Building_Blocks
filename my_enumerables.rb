module Enumerable
    def my_each
        i = 0
        while i < self.length
            yield(self[i])
            i += 1
        end
        self
    end

    def my_each_with_index
        i = 0
        while i < self.length
            yield(self[i], i)
            i += 1
        end
        self
    end

    def my_select
        result_array = []
        i = 0
        while i < self.length
            if yield(self[i]) == true
                result_array << self[i]
            end
            i += 1
        end
        return result_array
    end

    def my_all?
        checker = 0
        i = 0
        while i < self.length
            if yield(self[i]) != true
                checker += 1
                return false
            end
            i += 1
        end
        checker == 0 ? true : false
    end

    def my_any?
        checker = 0
        i = 0
        while i < self.length
            if yield(self[i]) == true
                checker += 1
                true
            end
            i += 1
        end
        checker == 0 ? false : true
    end

    def my_none?
        checker = 0
        i = 0
        while i < self.length
            if yield(self[i]) == true
                checker += 1
                false 
            end
            i += 1
        end
        checker == 0 ? true : false
    end

    def my_count(arg=nil)
        count = 0

        if block_given?
            i = 0
            while i < self.length
                if yield(self[i]) == true
                    count += 1
                end
                i += 1
            end
            return count
        end

        if arg == nil
            return self.length
        else
            self.my_each do |x|
                if x == arg
                    count += 1
                end
            end
            return count
        end
    end

    def my_map(my_proc=nil)
        result_array = []
        i = 0
        if my_proc
            while i < self.length
                result_array << proc.call(self[i])
                i += 1
            end
            return result_array
        else
            while i < self.length
                result_array << yield(self[i])
                i += 1
            end
            return result_array
        end
    end

    def my_inject(value=self[0])
        i = 0
        if value == self[0]
            i = 1
        end

        while i < self.length
           value = yield(value, self[i])
            i += 1
        end
        return value
    end
end

def multiply_els(array)
    result = array.my_inject { |total, current| total * current }
    return result
end
