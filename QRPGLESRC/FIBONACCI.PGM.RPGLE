**FREE
// Prints the Fibonacci Series for the number of terms entered (1 to 90)
// e.g. CALL FIBONACCI PARM('10')

Dcl-Pi *N;
  inParm Char(5);
End-Pi;

Dcl-S count Int(5);
Dcl-S i     Int(5);
Dcl-S a     Packed(20:0) Inz(0);
Dcl-S b     Packed(20:0) Inz(1);
Dcl-S next  Packed(20:0);
Dcl-S term  Varchar(20);
Dcl-S line  Varchar(50) Inz('');

Monitor;
  count = %int(%trim(inParm));
On-Error;
  count = 0;
Endmon;

Dsply 'Enter number of terms:' '' count;

// 90 is the limit so the largest term still fits in Packed(20:0)
if count < 1 or count > 90;
  Dsply 'Enter a count from 1 to 90';
  *INLR = *On;
  Return;
endif;

// Terms are packed onto lines of up to 50 characters since Dsply shows 52 at most
For i = 1 to count;
  term = %char(a);

  if %len(line) = 0;
    line = term;
  elseif %len(line) + 1 + %len(term) <= 50;
    line += ' ' + term;
  else;
    Dsply line;
    line = term;
  endif;

  eval next = a + b;
  a = b;
  b = next;
Endfor;

if %len(line) > 0;
  Dsply line;
endif;

*INLR = *On;
