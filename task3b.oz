declare local X Y in
  X = "This is a string"
  thread {Show Y} end
  Y = X 
end

/*  
  showInfo can print Y before it is assigned because it uses a thread that waits for Y to be assigned in the next line
  If it is pass by value then Y = X sets the value of Y equal to X's value.
  If it is pass by reference then Y = X, makes Y point at the same memory location as X. 
*/ 

