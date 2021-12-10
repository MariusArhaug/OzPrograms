declare GenerateOdd in

  fun {GenerateOdd S E} D = E - 2 in 
    if S < D then
      if {Int.isOdd S} then
        S | {GenerateOdd S+2 E}
      else
        S | {GenerateOdd S+1 E}
      end
    else
      if {Int.isOdd S} then
        S | nil
      else  
        nil
      end
    end  
  end

  {System.show {GenerateOdd ~3 10}}
  {System.show {GenerateOdd 3 3}}
  {System.show {GenerateOdd 2 2}}
