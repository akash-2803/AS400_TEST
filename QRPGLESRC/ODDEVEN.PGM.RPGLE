**FREE
// Determines whether an entered number is ODD or EVEN
// e.g. CALL ODDEVEN PARM('5')

Dcl-Pi *N;
  i_num Char(5);
End-Pi;

Dcl-S num Packed(9:0);

monitor;
  num = %int(%trim(i_num));
on-error;
  num = 0;
endmon; 

Dsply 'Enter a number:' '' num;

if %rem(num:2) = 0;
  Dsply 'EVEN';
else;
  Dsply 'ODD';
endif;

*INLR = *On;
