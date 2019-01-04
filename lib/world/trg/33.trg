#3300
Сет (витязей-лекарей)(доспех+7 шмоток)~
1 b 100
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
1 b 100
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
1 b 100
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
      if %char.class% == 0 || %char.class% == 9
        halt                                  
      end
    end 
  end
  otransform 3310
end
~
#3303
Сет (витязей)(меч+13 шмоток)~
1 b 100
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
1 b 100
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
1 b 100
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
#3306
Сет (кузей-батыров)(пояс+3 шмотки)~
1 b 100
~
wait 5s 
if %self.vnum% == 3336
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 3324  && %item.vnum% < 3346
      eval num %num%+1
    end
  done
  if %num%>3 
    if %char.class% == 11 || %char.class% == 3
      otransform 3337                       
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
      if %item.vnum% > 3324  && %item.vnum% < 3346
        eval num %num%+1
      end
    done
    if %num%>3 
      if %char.class% == 11 || %char.class% == 3
        halt                                  
      end
    end 
  end
  otransform 3336
end
~
#3307
Сет (кузей-батыров)(кольчуга+7 шмоток)~
1 b 100
~
wait 5s 
if %self.vnum% == 3338
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 3324  && %item.vnum% < 3346
      eval num %num%+1
    end
  done
  if %num%>7 
    if %char.class% == 3 || %char.class% == 11
      otransform 3339                       
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
      if %item.vnum% > 3324  && %item.vnum% < 3346
        eval num %num%+1
      end
    done
    if %num%>7 
      if %char.class% == 3 || %char.class% == 11
        halt                                  
      end
    end 
  end
  otransform 3338
end
~
#3308
Сет (кузей-батыров)(шишак+11 шмоток)~
1 b 100
~
wait 5s 
if %self.vnum% == 3334
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 3324  && %item.vnum% < 3346
      eval num %num%+1
    end
  done
  if %num%>11 
    if %char.class% == 3 || %char.class% == 11
      otransform 3335                       
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
      if %item.vnum% > 3324  && %item.vnum% < 3346
        eval num %num%+1
      end
    done
    if %num%>11 
      if %char.class% == 3 || %char.class% == 11
        halt                                  
      end
    end 
  end
  otransform 3334
end
~
#3309
Сет (батыров)(перчатки+13 шмоток)~
1 b 100
~
wait 5s 
if %self.vnum% == 3332
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 3324  && %item.vnum% < 3346
      eval num %num%+1
    end
  done
  if %num%>13 
    if %char.class% == 3
      otransform 3333                       
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
      if %item.vnum% > 3324  && %item.vnum% < 3346
        eval num %num%+1
      end
    done
    if %num%>13 
      if %char.class% == 3
        halt                                  
      end
    end 
  end
  otransform 3332
end
~
#3310
Сет (батыров)(все 15 шмоток)~
1 b 100
~
wait 5s 
if %self.vnum% == 3340
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 3324  && %item.vnum% < 3346
      eval num %num%+1
    end
  done
  if %num%>14 
    if %char.class% == 3
      otransform 3341                       
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
      if %item.vnum% > 3324  && %item.vnum% < 3346
        eval num %num%+1
      end
    done
    if %num%>14 
      if %char.class% == 3
        halt                                  
      end
    end 
  end
  otransform 3340
end
~
#3311
Сет (кузей)(сабля+13 шмоток)~
1 b 100
~
wait 5s 
if %self.vnum% == 3344
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 3324  && %item.vnum% < 3346
      eval num %num%+1
    end
  done
  if %num%>13 
    if %char.class% == 11
      otransform 3345                       
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
      if %item.vnum% > 3324 && %item.vnum% < 3346
        eval num %num%+1
      end
    done
    if %num%>13 
      if %char.class% == 11
        halt                                  
      end
    end 
  end
  otransform 3344
end
~
#3312
Сет (кузей)(все 16 шмоток)~
1 b 100
~
wait 5s 
if %self.vnum% == 3342
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 3324  && %item.vnum% < 3346
      eval num %num%+1
    end
  done
  if %num%>15 
    if %char.class% == 11
      otransform 3343                       
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
      if %item.vnum% > 3324  && %item.vnum% < 3346
        eval num %num%+1
      end
    done
    if %num%>15 
      if %char.class% == 11
        halt                                  
      end
    end 
  end
  otransform 3342
end
~
#3313
Сет (дружей-охотов)(плащ+3 шмотки)~
1 b 100
~
wait 5s 
if %self.vnum% == 3354
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 3344  && %item.vnum% < 3366
      eval num %num%+1
    end
  done
  if %num%>3 
    if %char.class% == 5 || %char.class% == 10
      otransform 3355                       
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
      if %item.vnum% > 3344  && %item.vnum% < 3366
        eval num %num%+1
      end
    done
    if %num%>3 
      if %char.class% == 5 || %char.class% == 10
        halt                                  
      end
    end 
  end
  otransform 3354
end
~
#3314
Сет (дружей-охотов)(пояс+7 шмоток)~
1 b 100
~
wait 5s 
if %self.vnum% == 3356
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 3344  && %item.vnum% < 3366
      eval num %num%+1
    end
  done
  if %num%>7 
    if %char.class% == 5 || %char.class% == 10
      otransform 3357                       
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
      if %item.vnum% > 3344  && %item.vnum% < 3366
        eval num %num%+1
      end
    done
    if %num%>7 
      if %char.class% == 5 || %char.class% == 10
        halt                                  
      end
    end 
  end
  otransform 3356
end
~
#3315
Сет (дружей-охотов)(шлем+11 шмоток)~
1 b 100
~
wait 5s 
if %self.vnum% == 3358
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 3344  && %item.vnum% < 3366
      eval num %num%+1
    end
  done
  if %num%>11 
    if %char.class% == 5 || %char.class% == 10
      otransform 3359                       
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
      if %item.vnum% > 3344  && %item.vnum% < 3366
        eval num %num%+1
      end
    done
    if %num%>11 
      if %char.class% == 5 || %char.class% == 10
        halt                                  
      end
    end 
  end
  otransform 3358
end
~
#3316
Сет (охотов)(все 15 шмоток)~
1 b 100
~
wait 5s 
if %self.vnum% == 3360
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 3344  && %item.vnum% < 3366
      eval num %num%+1
    end
  done
  if %num%>14 
    if %char.class% == 10
      otransform 3361                       
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
      if %item.vnum% > 3344  && %item.vnum% < 3366
        eval num %num%+1
      end
    done
    if %num%>14 
      if %char.class% == 10
        halt                                  
      end
    end 
  end
  otransform 3360
end
~
#3317
Сет (дружей)(сабля+13 шмоток)~
1 b 100
~
wait 5s 
if %self.vnum% == 3362
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 3344  && %item.vnum% < 3366
      eval num %num%+1
    end
  done
  if %num%>13 
    if %char.class% == 5
      otransform 3363                       
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
      if %item.vnum% > 3344 && %item.vnum% < 3366
        eval num %num%+1
      end
    done
    if %num%>13 
      if %char.class% == 5
        halt                                  
      end
    end 
  end
  otransform 3362
end
~
#3318
Сет (дружей)(все 16 шмоток)~
1 b 100
~
wait 5s 
if %self.vnum% == 3364
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 3344  && %item.vnum% < 3366
      eval num %num%+1
    end
  done
  if %num%>15 
    if %char.class% == 5
      otransform 3365                       
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
      if %item.vnum% > 3344  && %item.vnum% < 3366
        eval num %num%+1
      end
    done
    if %num%>15 
      if %char.class% == 5
        halt                                  
      end
    end 
  end
  otransform 3364
end
~
#3319
Сет (волшей-купцов)(плащ+3 шмотки)~
1 b 100
~
wait 5s 
if %self.vnum% == 3373
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 3365  && %item.vnum% < 3386
      eval num %num%+1
    end
  done
  if %num%>3 
    if %char.class% == 7 || %char.class% == 12
      otransform 3374                       
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
      if %item.vnum% > 3365  && %item.vnum% < 3386
        eval num %num%+1
      end
    done
    if %num%>3 
      if %char.class% == 7 || %char.class% == 12
        halt                                  
      end
    end 
  end
  otransform 3373
end
~
#3320
Сет (волшей-купцов)(пояс+7 шмоток)~
1 b 100
~
wait 5s 
if %self.vnum% == 3375
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 3365  && %item.vnum% < 3386
      eval num %num%+1
    end
  done
  if %num%>7 
    if %char.class% == 7 || %char.class% == 12
      otransform 3376                       
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
      if %item.vnum% > 3365 && %item.vnum% < 3386
        eval num %num%+1
      end
    done
    if %num%>7 
      if %char.class% == 7 || %char.class% == 12
        halt                                  
      end
    end 
  end
  otransform 3375
end
~
#3321
Сет (волшей-купцов)(обруч+11 шмоток)~
1 b 100
~
wait 5s 
if %self.vnum% == 3377
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 3365  && %item.vnum% < 3386
      eval num %num%+1
    end
  done
  if %num%>11 
    if %char.class% == 7 || %char.class% == 12
      otransform 3378                       
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
      if %item.vnum% > 3365  && %item.vnum% < 3386
        eval num %num%+1
      end
    done
    if %num%>11 
      if %char.class% == 7 || %char.class% == 12
        halt                                  
      end
    end 
  end
  otransform 3377
end
~
#3322
Сет (волшей)(все 15 шмоток)~
1 b 100
~
wait 5s 
if %self.vnum% == 3379
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 3365  && %item.vnum% < 3386
      eval num %num%+1
    end
  done
  if %num%>14 
    if %char.class% == 7
      otransform 3380                       
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
      if %item.vnum% > 3365  && %item.vnum% < 3386
        eval num %num%+1
      end
    done
    if %num%>14 
      if %char.class% == 7
        halt                                  
      end
    end 
  end
  otransform 3379
end
~
#3323
Сет (купцов)(нож+13 шмоток)~
1 b 100
~
wait 5s 
if %self.vnum% == 3384
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 3365  && %item.vnum% < 3386
      eval num %num%+1
    end
  done
  if %num%>13 
    if %char.class% == 12
      otransform 3385                       
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
      if %item.vnum% > 3365 && %item.vnum% < 3386
        eval num %num%+1
      end
    done
    if %num%>13 
      if %char.class% == 12
        halt                                  
      end
    end 
  end
  otransform 3384
end
~
#3324
Сет (купцов)(все 16 шмоток)~
1 b 100
~
wait 5s 
if %self.vnum% == 3382
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 3365  && %item.vnum% < 3386
      eval num %num%+1
    end
  done
  if %num%>15 
    if %char.class% == 12
      otransform 3383                       
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
      if %item.vnum% > 3365  && %item.vnum% < 3386
        eval num %num%+1
      end
    done
    if %num%>15 
      if %char.class% == 12
        halt                                  
      end
    end 
  end
  otransform 3382
end
~
$~
