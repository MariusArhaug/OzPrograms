declare GenerateOdd Product in

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

  fun {Product S} Reduce in 
    fun {Reduce S Acc} 
      case S 
        of H | T then {Reduce T Acc * H}
        [] nil then Acc 
      end
    end
    {Reduce S 1}
  end 

  local OddList in
    thread OddList = {GenerateOdd 0 1000} end
    thread {System.showInfo {Product OddList}} end
  end