functor 
export 
   new       : NewStack  
   fromStack : ListToStack  
   Get Put Top IsEmpty Clear ToList Push Pop
define 
   fun {NewStack}      {Cell.new nil} end 
   fun {ListToStack L} {Cell.new L  } end 
    
   fun {Get C} Old New in 
      {Exchange C Old New}
      case Old of nil then New=nil raise empty end 
      [] H|T then New=T H
      end 
   end 
   Pop = Get
    
   proc {Put C X} Old New  in New=X|Old {Exchange C Old New} end 
   Push = Put
    
   fun {Top C}
      case {Access C} of H|_ then H
      else raise empty end end 
   end 
    
   fun  {IsEmpty C} {Access C}==nil end 
   proc {Clear   C} {Assign C nil}  end 
   fun  {ToList  C} {Access C}      end 
end