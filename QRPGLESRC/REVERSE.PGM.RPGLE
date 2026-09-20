**FREE
// Reverses an entered string
Dcl-Pi *N;
  inParm Char(32);
End-Pi;

Dcl-S inStr    Char(50);
Dcl-S outStr   Char(50);
Dcl-S len      Int(5);
Dcl-S i        Int(5);
Dcl-S dsplyStr Char(50);

inStr = inParm;

dsplyStr = 'Entered string: ' + inStr;
Dsply dsplyStr;

len = %len(%trimr(inStr));
outStr = '';
i = 1;
Dow i <= len;
  %subst(outStr:i:1) = %subst(inStr:len - i + 1:1);
  i += 1;
Enddo;

Dsply %trim(outStr);

*INLR = *On;
