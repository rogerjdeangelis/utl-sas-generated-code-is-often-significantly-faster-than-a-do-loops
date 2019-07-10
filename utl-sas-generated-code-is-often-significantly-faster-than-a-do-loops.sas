SAS generated code is often significantly faster than a do loops                                                               
                                                                                                                               
Analysis insired by                                                                                                            
Joe Matise                                                                                                                     
snoopy369@gmail.com                                                                                                            
on SAS-L                                                                                                                       
                                                                                                                               
Problem                                                                                                                        
  Given a 25 element array.                                                                                                    
  If any element =0 then set element to 1                                                                                      
                                                                                                                               
Two Solutions                                                                                                                  
                                                                                                                               
    1. Generated Code                                                                                                          
    2. Do Loop                                                                                                                 
                                                                                                                               
Modern processors can execute multiple instruction streams simultaneously.                                                     
Also SAS mpping of elements from and to the PDV is costly?                                                                     
                                                                                                                               
Benchmarks                                                                                                                     
----------                                                                                                                     
                                                                                                                               
    Seconds  Algorithm                                                                                                         
                                                                                                                               
   1.  58   Generated Ifs statements                                                                                           
   2. 104   Do loop                                                                                                            
                                                                                                                               
Two algorithms                                                                                                                 
                                                                                                                               
25 If statements is considerable faster than                                                                                   
                                                                                                                               
  if x1 = 0 then x1=1;                                                                                                         
  if x2 = 0 then x2=1;                                                                                                         
  if x3 = 0 then x3=1;                                                                                                         
  ....                                                                                                                         
  ....                                                                                                                         
  if x23 = 0 then x23=1;                                                                                                       
  if x24 = 0 then x24=1;                                                                                                       
  if x25 = 0 then x25=1;                                                                                                       
                                                                                                                               
a do loop                                                                                                                      
                                                                                                                               
 array xs[25] x1-x25;                                                                                                          
 do i=1 to 25;                                                                                                                 
   if xs[i]=0 then xs[i]=1;                                                                                                    
 end;                                                                                                                          
                                                                                                                               
github                                                                                                                         
https://tinyurl.com/y4qdp9ln                                                                                                   
https://github.com/rogerjdeangelis/utl-sas-generated-code-is-often-significantly-faster-than-a-do-loops                        
                                                                                                                               
macros                                                                                                                         
https://tinyurl.com/y9nfugth                                                                                                   
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories                                     
                                                                                                                               
*_                   _                                                                                                         
(_)_ __  _ __  _   _| |_                                                                                                       
| | '_ \| '_ \| | | | __|                                                                                                      
| | | | | |_) | |_| | |_                                                                                                       
|_|_| |_| .__/ \__,_|\__|                                                                                                      
        |_|                                                                                                                    
;                                                                                                                              
                                                                                                                               
data have ;                                                                                                                    
 trtain id;                                                                                                                    
 array xs[25] x1-x25 (25*0) ;                                                                                                  
 do id=1 to 1e8 ;                                                                                                              
  output ;                                                                                                                     
 end ;                                                                                                                         
                                                                                                                               
 stop ;                                                                                                                        
                                                                                                                               
run;quit;                                                                                                                      
                                                                                                                               
HAVE total obs=100,000,000                                                                                                     
                                                                                                                               
 ID  X1 X2 X3 X4 X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X15 X16 X17 X18 X19 X20 X21 X22 X23 X24 X25                                
                                                                                                                               
  1   0  0  0  0  0  0  0  0  0  0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0                                 
  2   0  0  0  0  0  0  0  0  0  0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0                                 
  3   0  0  0  0  0  0  0  0  0  0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0                                 
...                                                                                                                            
                                                                                                                               
*            _               _                                                                                                 
  ___  _   _| |_ _ __  _   _| |_                                                                                               
 / _ \| | | | __| '_ \| | | | __|                                                                                              
| (_) | |_| | |_| |_) | |_| | |_                                                                                               
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                              
                |_|                                                                                                            
;                                                                                                                              
                                                                                                                               
HAVE total obs=100,000,000                                                                                                     
                                                                                                                               
 ID  X1 X2 X3 X4 X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X15 X16 X17 X18 X19 X20 X21 X22 X23 X24 X25                                
                                                                                                                               
  1   1  1  1  1  1  1  1  1  1  1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1                                 
  2   1  1  1  1  1  1  1  1  1  1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1                                 
  3   1  1  1  1  1  1  1  1  1  1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1                                 
...                                                                                                                            
                                                                                                                               
*          _       _   _                                                                                                       
 ___  ___ | |_   _| |_(_) ___  _ __                                                                                            
/ __|/ _ \| | | | | __| |/ _ \| '_ \                                                                                           
\__ \ (_) | | |_| | |_| | (_) | | | |                                                                                          
|___/\___/|_|\__,_|\__|_|\___/|_| |_|                                                                                          
                                                                                                                               
;                                                                                                                              
                                                                                                                               
*_                                       _                                                                                     
/ |      __ _  ___ _ __     ___ ___   __| | ___                                                                                
| |     / _` |/ _ \ '_ \   / __/ _ \ / _` |/ _ \                                                                               
| |_   | (_| |  __/ | | | | (_| (_) | (_| |  __/                                                                               
|_(_)   \__, |\___|_| |_|  \___\___/ \__,_|\___|                                                                               
        |___/                                                                                                                  
;                                                                                                                              
                                                                                                                               
%array(xs,values=1-25);                                                                                                        
                                                                                                                               
data want;                                                                                                                     
                                                                                                                               
 set have;                                                                                                                     
                                                                                                                               
 * generate 25 if statements;                                                                                                  
 %do_over(xs,phrase=%str(if x? = 0 then x?=1;));                                                                               
                                                                                                                               
run;quit;                                                                                                                      
                                                                                                                               
MPRINT(DO_OVER):  if x1 = 0 then x1=1;                                                                                         
MPRINT(DO_OVER):  if x2 = 0 then x2=1;                                                                                         
MPRINT(DO_OVER):  if x3 = 0 then x3=1;                                                                                         
MPRINT(DO_OVER):  if x4 = 0 then x4=1;                                                                                         
MPRINT(DO_OVER):  if x5 = 0 then x5=1;                                                                                         
MPRINT(DO_OVER):  if x6 = 0 then x6=1;                                                                                         
MPRINT(DO_OVER):  if x7 = 0 then x7=1;                                                                                         
MPRINT(DO_OVER):  if x8 = 0 then x8=1;                                                                                         
MPRINT(DO_OVER):  if x9 = 0 then x9=1;                                                                                         
MPRINT(DO_OVER):  if x10 = 0 then x10=1;                                                                                       
MPRINT(DO_OVER):  if x11 = 0 then x11=1;                                                                                       
MPRINT(DO_OVER):  if x12 = 0 then x12=1;                                                                                       
MPRINT(DO_OVER):  if x13 = 0 then x13=1;                                                                                       
MPRINT(DO_OVER):  if x14 = 0 then x14=1;                                                                                       
MPRINT(DO_OVER):  if x15 = 0 then x15=1;                                                                                       
MPRINT(DO_OVER):  if x16 = 0 then x16=1;                                                                                       
MPRINT(DO_OVER):  if x17 = 0 then x17=1;                                                                                       
MPRINT(DO_OVER):  if x18 = 0 then x18=1;                                                                                       
MPRINT(DO_OVER):  if x19 = 0 then x19=1;                                                                                       
MPRINT(DO_OVER):  if x20 = 0 then x20=1;                                                                                       
MPRINT(DO_OVER):  if x21 = 0 then x21=1;                                                                                       
MPRINT(DO_OVER):  if x22 = 0 then x22=1;                                                                                       
MPRINT(DO_OVER):  if x23 = 0 then x23=1;                                                                                       
MPRINT(DO_OVER):  if x24 = 0 then x24=1;                                                                                       
MPRINT(DO_OVER):  if x25 = 0 then x25=1;                                                                                       
                                                                                                                               
                                                                                                                               
NOTE: There were 100000000 observations read from the data set WORK.HAVE.                                                      
NOTE: The data set WORK.WANT has 100000000 observations and 26 variables.                                                      
NOTE: DATA statement used (Total process time):                                                                                
   real time      57.98 seconds                                                                                                
   cpu time      57.48 seconds                                                                                                 
                                                                                                                               
                                                                                                                               
*____           _         _                                                                                                    
|___ \       __| | ___   | | ___   ___  _ __                                                                                   
  __) |     / _` |/ _ \  | |/ _ \ / _ \| '_ \                                                                                  
 / __/ _   | (_| | (_) | | | (_) | (_) | |_) |                                                                                 
|_____(_)   \__,_|\___/  |_|\___/ \___/| .__/                                                                                  
                                       |_|                                                                                     
;                                                                                                                              
                                                                                                                               
                                                                                                                               
data want;                                                                                                                     
 set have;                                                                                                                     
 array xs[25] x1-x25;                                                                                                          
 do i=1 to 25;                                                                                                                 
   if xs[i]=0 then xs[i]=1;                                                                                                    
 end;                                                                                                                          
 drop i;                                                                                                                       
 output;                                                                                                                       
run;                                                                                                                           
                                                                                                                               
NOTE: There were 100000000 observations read from the data set WORK.HAVE.                                                      
NOTE: The data set WORK.WANT has 100000000 observations and 26 variables.                                                      
NOTE: DATA statement used (Total process time):                                                                                
   real time      1:43.95                                                                                                      
   cpu time      1:43.16                                                                                                       
                                                                                                                               
                                                                                                                               
