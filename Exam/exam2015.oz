declare PickListItem ListMultiplesOf Expr in

  fun {PickListItem Itemno List}
    
    fun {PickListItemHelp Itemno List I}
      case List of nil then nil
      [] H | T then 
        if Itemno == I then H
        else {PickListItemHelp Itemno T I+1} end
      end
    end
    in
    {PickListItemHelp Itemno List 1} 
  end

  {System.show {PickListItem 2 [1 2 3]}}

  fun lazy {ListMultiplesOf Multiplier}
    fun {GenerateStream StartValue Multiplier}
      (StartValue * Multiplier )| {GenerateStream StartValue+1 Multiplier}
    end
    in 
    {GenerateStream 0 Multiplier}
  end

  %local A B C in 
  %{Browse {ListMultiplesOf 7}}
  %{Browse [A B C] = {ListMultiplesOf 7}}
  %end

  fun {Expr In ?Out}
    case In of nil then nil
    [] H | T then 
      Out = T
      [Name _ Value] = H
      equal(Name Value)
    end
  end