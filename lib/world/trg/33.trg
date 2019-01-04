* BRusMUD trigger file v1.0
#3300
Сет (витязей-лекарей)(доспех+7 шмоток)~
1 b0 100
~
wait 5s 
if %self.vnum% == 3308
  if !%self.worn_by%
     halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
     eval i %i%+1
     set item %char.eq(%i%)%  
     if %item.vnum% > 2999  && %item.vnum% < 3321
        eval num %num%+1
     end
  done
  if %num%>7 
  if %char.class% == 0 || %char.class% == 9
     otransform 3309                       
  end
  end
else
  if %self.worn_by%
     set char %self.worn_by%
     set i 0  
     set num 0
     while %i% < 18
        eval i %i%+1
        set item %char.eq(%i%)%  
        if %item.vnum% > 2999  && %item.vnum% < 3321
           eval num %num%+1
        end
     done
     if %num%>7 
     if %char.class% == 0 || %char.class% == 9
        halt                                  
     end
     end 
  end
  otransform 3308
end

~
#3301
Сет (витязей-лекарей)(крест+11 шмоток)~
1 b0 100
~
wait 5s 
if %self.vnum% == 3319
  if !%self.worn_by%
     halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
     eval i %i%+1
     set item %char.eq(%i%)%  
     if %item.vnum% > 2999  && %item.vnum% < 3321
        eval num %num%+1
     end
  done
  if %num%>11 
  if %char.class% == 0 || %char.class% == 9
     otransform 3320                       
  end
  end
else
  if %self.worn_by%
     set char %self.worn_by%
     set i 0  
     set num 0
     while %i% < 18
        eval i %i%+1
        set item %char.eq(%i%)%  
        if %item.vnum% > 2999  && %item.vnum% < 3321
           eval num %num%+1
        end
     done
     if %num%>11 
     if %char.class% == 0 || %char.class% == 9
        halt                                  
     end
     end 
  end
  otransform 3319
end

~
#3302
Сет (витязей-лекарей)(шлем+3 шмотки)~
1 b0 100
~
wait 5s 
if %self.vnum% == 3310
  if !%self.worn_by%
     halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
     eval i %i%+1
     set item %char.eq(%i%)%  
     if %item.vnum% > 2999  && %item.vnum% < 3321
        eval num %num%+1
     end
  done
  if %num%>3 
  if %char.class% == 0 || %char.class% == 9
     otransform 3311                       
  end
  end
else
  if %self.worn_by%
     set char %self.worn_by%
     set i 0  
     set num 0
     while %i% < 18
        eval i %i%+1
        set item %char.eq(%i%)%  
        if %item.vnum% > 2999  && %item.vnum% < 3321
           eval num %num%+1
        end
     done
     if %num%>3 
     if %%char.class% == 0 || %char.class% == 9
        halt                                  
     end
     end 
  end
  otransform 3310
end

~
#3303
Сет (витязей)(меч+13 шмоток)~
1 b0 100
~
wait 5s 
if %self.vnum% == 3314
  if !%self.worn_by%
     halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
     eval i %i%+1
     set item %char.eq(%i%)%  
     if %item.vnum% > 2999  && %item.vnum% < 3321
        eval num %num%+1
     end
  done
  if %num%>13 
  if %char.class% == 9
     otransform 3315                       
  end
  end
else
  if %self.worn_by%
     set char %self.worn_by%
     set i 0  
     set num 0
     while %i% < 18
        eval i %i%+1
        set item %char.eq(%i%)%  
        if %item.vnum% > 2999  && %item.vnum% < 3321
           eval num %num%+1
        end
     done
     if %num%>13 
     if %char.class% == 9
        halt                                  
     end
     end 
  end
  otransform 3314
end

~
#3304
Сет (витязей)(все 16 шмоток)~
1 b0 100
~
wait 5s 
if %self.vnum% == 3316
  if !%self.worn_by%
     halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
     eval i %i%+1
     set item %char.eq(%i%)%  
     if %item.vnum% > 2999  && %item.vnum% < 3321
        eval num %num%+1
     end
  done
  if %num%>15 
  if %char.class% == 9
     otransform 3317                       
  end
  end
else
  if %self.worn_by%
     set char %self.worn_by%
     set i 0  
     set num 0
     while %i% < 18
        eval i %i%+1
        set item %char.eq(%i%)%  
        if %item.vnum% > 2999  && %item.vnum% < 3321
           eval num %num%+1
        end
     done
     if %num%>15 
     if %char.class% == 9
        halt                                  
     end
     end 
  end
  otransform 3316
end

~
#3305
Сет (лекарей)(все 15 шмоток)~
1 b0 100
~
wait 5s 
if %self.vnum% == 3312
  if !%self.worn_by%
     halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
     eval i %i%+1
     set item %char.eq(%i%)%  
     if %item.vnum% > 2999  && %item.vnum% < 3321
        eval num %num%+1
     end
  done
  if %num%>14 
  if %char.class% == 0
     otransform 3313                       
  end
  end
else
  if %self.worn_by%
     set char %self.worn_by%
     set i 0  
     set num 0
     while %i% < 18
        eval i %i%+1
        set item %char.eq(%i%)%  
        if %item.vnum% > 2999  && %item.vnum% < 3321
           eval num %num%+1
        end
     done
     if %num%>14 
     if %char.class% == 0
        halt                                  
     end
     end 
  end
  otransform 3312
end

~
$
$
