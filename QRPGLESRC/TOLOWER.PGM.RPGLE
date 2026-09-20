**FREE
// Converts an entered string from Upper to Lower Case
// e.g. CALL TOLOWER PARM('Hello World')
Dcl-Pi *N;
  inParm Char(32);
End-Pi;

Dcl-S inStr  Char(50);
Dcl-S outStr Char(50);

Dsply 'Enter a String: ' '' inParm;
inStr = inParm;

outStr = %xlate('ABCDEFGHIJKLMNOPQRSTUVWXYZ':'abcdefghijklmnopqrstuvwxyz':inStr);

Dsply %trim(outStr);

*INLR = *On;
