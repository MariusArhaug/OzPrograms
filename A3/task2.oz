declare Sum in

  fun {Sum List}
    case List 
      of H | T then H + {Sum T}
      [] nil then 0
    end
  end

  {System.showInfo "Regular Sum recursion"}
  {Show {Sum [1 2 3]}}
