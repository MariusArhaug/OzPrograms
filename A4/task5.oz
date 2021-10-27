declare HammerFactory RandomInt HammerConsumer BoundBuffer in

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
    {Time.delay 1000}
    RandInt = {RandomInt 0 100}
    if RandInt =< 10 then
      'defect' | {HammerFactory}
    else 
      if RandInt =< 90 then
      'working' | {HammerFactory}
      else
        {HammerFactory}
      end
    end
  end

  fun {HammerConsumer HammerStream N} Count in  
    fun {Count HammerStream N Acc}
      if N > 0 then
        case HammerStream 
          of 'working' | T then
            {Count T N-1 Acc + 1} 
          [] _ then
            Acc
        end
      else
        Acc
      end
    end
    {Count HammerStream N 0}
  end

  % local HammerTime B in
  %   HammerTime = {HammerFactory}
  %   B = HammerTime.2.2.2.1
  %   {System.show HammerTime}
  % end

  local HammerTime Consumer in
    HammerTime = {HammerFactory}
    Consumer = {HammerConsumer HammerTime 10}
    {System.show Consumer}
  end

  fun {BoundBuffer HammerStream N} StreamEnd GetFromStream in

    StreamEnd = thread {List.drop HammerStream N} end

    fun lazy {GetFromStream HammerStream End}
      case HammerStream 
        of H | T then 
          H | {GetFromStream T thread End.2 end}
        
    end

    {GetFromStream HammerStream StreamEnd}
  end