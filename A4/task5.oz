declare HammerFactory RandomInt in

% a)
  fun {RandomInt Min Max}
    X = {OS.rand}
    MinOS
    MaxOS
    in
    {OS.randLimits ?MinOS ?MaxOS}
    
    Min + X * (Max - Min) div (MaxOS - MinOS)
      
  end

  fun lazy {HammerFactory} RandInt in
    RandInt = {RandomInt 0 100}
    if RandInt =< 10 then
      'defect' | {HammerFactory}
    else 
      if RandInt =< 88 then
      'working' | {HammerFactory}
      else
        {HammerFactory} | nil
      end
    end
  end

  local HammerTime B in
    HammerTime = {HammerFactory}
    B = HammerTime.2.2.2.1
    {System.show HammerTime}
  end