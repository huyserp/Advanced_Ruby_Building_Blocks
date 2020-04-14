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
            else
                false
            end
            i += 1
        end
        if checker != 0
            true
        end
    end

    def my_any?
        checker = 0
        i = 0
        while i < self.length
            yield(self[i]) != true ? next : checker += 1
            i += 1
        end
        checker == 0 ? false : true
    end

    def my_none?
        i = 0
        while i < self.length
            if yield(self[i]) == true
                return false
                break
            end
            i += 1
        end
    end

    def my_count
    end

    def my_map
        result_array = []
        i = 0
        while i < self.length
            result_array << yield(self[i])
            i += 1
        end
        return result_array
    end

    def my_inject
    end

end
