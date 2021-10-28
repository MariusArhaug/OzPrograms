declare GenerateOdd Product in

  fun lazy {GenerateOdd S E} D = E - 2 in 
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
    thread OddList = {GenerateOdd 1 1000} end
    thread {System.showInfo {Product OddList}} end
  end

  /*
  Task 3 
  The first three digits are 100, we make OddList from 1 to 1000 (not including) else we would have to make a product of 0 * rest and that would result in 0
  
  When using multiple threads we can achieve parallellization with processes that do not rely on the current thread, can be instead be run on a seperate thread.

  Concurrent programming is the using of multiple threads.
  
  
  */


  /* 
  Task 4

  Lazy execution only generates values when lazy functions are explicity used
  {GenerateOdd 1 3} would return the function itself while calling it {Product {GenerateOdd 0 3}} would call the function itself
  This technique optimizes resource management for only when its asked for.

  For each reduce fold in Product the {GenerateOdd } function will be called, the function itself has to be triggered by lazy execution
   causing it to need ot make an extra call before it being triggered. 

  */