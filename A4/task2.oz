declare Product in 

  fun {Product S} Reduce in 

    fun {Reduce S Acc} 
      case S 
        of H | T then {Reduce T Acc * H}
        [] nil then Acc 
      end
    end
    {Reduce S 1}
  end 

  {System.show {Product [1 2 3 4]}}