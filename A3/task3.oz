declare RightFold LeftFold Sum Length Product in

  fun {RightFold List Op U}
    case List 
      of H | T then {Op H {RightFold T Op U}}
      [] nil then 0
    end
  end


  fun {Sum List} 
    {RightFold List fun {$ X Y} X + Y end 0}
  end

  fun {Length List}
    {RightFold List fun {$ A B} B + 1 end 0}
  end 

  fun {Product List} 
    {RightFold List 
    fun {$ A B}
      if B == 0 then
        A 
      else 
        A * B
      end 
    end 1}
  end 

  {System.Show "Test Rightfold Sum and Leftfold Sum"}
  local A = [1 2 3 4] in
    {Show {Sum A}}
    {Show {Sum2 A}}
  end

  {System.Show "Test RigthFold Length and Leftfold Length"}
  local A = [1 2 3 4 5 6] in
    {Show {Length A}}
  end

  {System.Show "Test Rightfold Product"}
  local A = [1 2 3 4] in
    {Show {Product A}}
  end