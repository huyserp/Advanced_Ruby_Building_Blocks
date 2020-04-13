def bubble_sort(array)
    shifting = true
    
    while shifting
        shift_count = 0
        working_counter = 0

        i = 0
        while i < (array.length - 1)
            if array[i] > array[(i + 1)]
                array[i], array[(i + 1)] = array[(i + 1)], array[i]
                working_counter += 1
            end
            i += 1
        end

        if shift_count != working_counter
            shift_count = working_counter
            i = 0
        else
            shifting = false
        end

    end

    return array  
end

def bubble_sort_by(array)
    shifting = true
    
    while shifting
        shift_count = 0
        working_counter = 0

        i = 0
        while i < (array.length - 1)
            if yield(array[i], array[(i + 1)]) > 0
                array[i], array[(i + 1)] = array[(i + 1)], array[i]
                working_counter += 1
            end
            i += 1
        end

        if shift_count != working_counter
            shift_count = working_counter
            i = 0
        else
            shifting = false
        end

    end

    return array  
end

puts puts 
puts bubble_sort([22,10,0,12,2,1,7,150,4,3,78,2,0,2])

puts puts

puts bubble_sort_by(["bonjour","hola","hi","hello","hey"]) { |left,right| left.length - right.length }
puts puts