**FREE
// Finds the Maximum and Minimum values in a list of numbers passed as a string
// e.g. CALL MAXMIN PARM('12 4 6 7')
Dcl-Pi *N;
  inParm Char(32);
End-Pi;

Dcl-S arr     Packed(9:0) Dim(50);
Dcl-S work    Char(33);
Dcl-S token   Varchar(32);
Dcl-S len     Int(5);
Dcl-S pos     Int(5);
Dcl-S start   Int(5);
Dcl-S n       Int(5);
Dcl-S i       Int(5);
Dcl-S max     Packed(9:0);
Dcl-S min     Packed(9:0);
Dcl-S outLine Varchar(50);

// work is one byte longer than inParm so its last byte is always a blank
work = inParm;
len = %len(%trimr(work));
pos = 1;
n = 0;

// Split the string on blanks and convert each piece to a number in arr
Dow pos <= len;
  Dow pos <= len and %subst(work:pos:1) = ' ';
    pos += 1;
  Enddo;

  if pos <= len;
    start = pos;
    Dow pos <= len and %subst(work:pos:1) <> ' ';
      pos += 1;
    Enddo;

    token = %subst(work:start:pos - start);
    n += 1;
    Monitor;
      arr(n) = %dec(token:9:0);
    On-Error;
      Dsply ('Invalid number: ' + token);
      *INLR = *On;
      Return;
    Endmon;
  endif;
Enddo;

if n < 1;
  Dsply 'Pass at least one number';
  *INLR = *On;
  Return;
endif;

max = arr(1);
min = arr(1);
i = 2;
Dow i <= n;
  if arr(i) > max;
    max = arr(i);
  endif;
  if arr(i) < min;
    min = arr(i);
  endif;
  i += 1;
Enddo;

outLine = 'Max-' + %trim(%char(max)) + ', Min-' + %trim(%char(min));
Dsply outLine;

*INLR = *On;
