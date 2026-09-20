**FREE
// Prints the multiplication table (1-10) of an entered number
Dcl-Pi *N;
  inParm Packed(15:5);
End-Pi;

Dcl-S num     Packed(7:0);
Dcl-S i       Int(5);
Dcl-S result  Packed(9:0);
Dcl-S outLine Varchar(50);

num = inParm;

outLine = '';
i = 1;
Dow i <= 10;
  result = num * i;
  if i = 1;
    outLine = %trim(%char(result));
  else;
    outLine = %trim(outLine) + ', ' + %trim(%char(result));
  endif;
  i += 1;
Enddo;

Dsply outLine;

*INLR = *On;
