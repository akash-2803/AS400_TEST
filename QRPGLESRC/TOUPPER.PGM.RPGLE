**FREE
// Converts an entered string from Lower to Upper Case
Dcl-Pi *N;
  inParm Char(32);
End-Pi;

Dcl-S inStr  Char(50);
Dcl-S outStr Char(50);

inStr = inParm;

outStr = %xlate('abcdefghijklmnopqrstuvwxyz':'ABCDEFGHIJKLMNOPQRSTUVWXYZ':inStr);

Dsply %trim(outStr);

*INLR = *On;
