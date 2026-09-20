**FREE
// Determines whether an entered number is ODD or EVEN
Dcl-S num Packed(9:0);

Dsply 'Enter a number:' '' num;

if %rem(num:2) = 0;
  Dsply 'EVEN';
else;
  Dsply 'ODD';
endif;

*INLR = *On;
