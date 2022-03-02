def stock_picker(stocks)#takes an Array of numbers (stocks) and returns a hash giving the pit and peak value for the best time to buy(:pit) and sell(:peak) the stock.

    return "ERROR: Array has less than 2 elements: #{stocks}" if (stocks.length < 2)

    peaks_and_pits = get_peaks_and_pits(stocks)

    #----------- these lines are for debugging purposes
    # p peaks_and_pits 
    # p peaks_and_pits.map{|val| stocks[val]}
    #--------------
    #Initialize the values
    i = 0

    i = 1 if stocks[peaks_and_pits[0]] > stocks[peaks_and_pits[1]]
   
    min_pit = peaks_and_pits[i]
    max_distance = stocks[peaks_and_pits[i + 1]] - stocks[min_pit]
    optimal_peak_and_pit = {peak: peaks_and_pits[i + 1], pit: min_pit}
    i += 2

    while(i + 1 < peaks_and_pits.length) 
    
        min_pit = peaks_and_pits[i] if stocks[peaks_and_pits[i]] < stocks[min_pit]


        if(stocks[peaks_and_pits[i + 1]] - stocks[min_pit] > max_distance)
            max_distance = stocks[peaks_and_pits[i + 1]] - stocks[min_pit]
            optimal_peak_and_pit[:peak] = peaks_and_pits[i + 1]
            optimal_peak_and_pit[:pit] = min_pit

        end


        i += 2
    end


    optimal_peak_and_pit

end





def get_peaks_and_pits(numArray) #takes an array of numbers and returns an array with the indicies of the peaks and pits in the order that they occured.

    peaks_and_pits = Array.new
    i = 1

    #intialization and front edge case
    while(i < numArray.length && numArray[i] == numArray[i - 1])#increases the index further if the same value repeats
        i += 1
    end

    numArray[i - 1] < numArray[i] ? climbing_up = true : climbing_up = false

    peaks_and_pits.push(i - 1)



    while(i < numArray.length)
        if(climbing_up)
            if(numArray[i] < numArray[i - 1])
                peaks_and_pits.push(i - 1)
                climbing_up = false
            end
        else
            if(numArray[i] > numArray[i - 1])
                peaks_and_pits.push(i - 1)
                climbing_up = true
            end
        end
        i += 1
    end

    #handle back edge case
    
    peaks_and_pits.push(i - 1) #unless numArray[i - 1] == numArray[i - 2]

    peaks_and_pits
end


#testInput = [2, 3, 2, 5, 4, 6, 4, 1, 0, 2, 4, 1, 15]
#testInput = [17,3,6,9,15,8,6,1,10]
testInput = [4000, 250, 5000, 100, 300, 400]
#testInput = [-4, -12, -4, 2, -1] #Because negative stocks totally exist

result = stock_picker(testInput)

puts "The best time to buy was when the stock was at #{testInput[result[:pit]]} on day #{result[:pit]}.\nThe best time to sell that stock was when the value was #{testInput[result[:peak]]} from day #{result[:peak]}\nTotal profit: #{testInput[result[:peak]] - testInput[result[:pit]]}"