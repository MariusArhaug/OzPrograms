/*
  A)
  Take in List 
  Recursivly pattern match on head | tail and then increment counter
  then do the same for remaining tail

 */
fun {Length List} 
  fun {Count List N} 
    case List of 
      [Head | Tail] then
        if Tail != nil then
          N += 1
          {Count Tail N}
        end
    end
    N 
  end

  {Count List 0}
end


/*
  B)

 */

fun {Take List Count} 


end