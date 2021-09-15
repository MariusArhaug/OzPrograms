declare proc {Circle R} A D C Pi in
  Pi = 355.0 / 113.0
  A = Pi * R * R
  D = 2.0 * R
  C = Pi * D 
  {Show A}
  {Show D}
  {Show C}
end 

{Circle 10.0} 