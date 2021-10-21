declare SumTailRecursion in

  fun {SumTailRecursion List} TailRecursion in
    fun {TailRecursion List Acc}
      case List 
        of H | T then {TailRecursion T Acc + H}
        [] nil then Acc
      end
    end
    {TailRecursion List 0}
  end

  {System.showInfo "Sum with tail recursion"}
  {Show {Sum [1 2 3]}}