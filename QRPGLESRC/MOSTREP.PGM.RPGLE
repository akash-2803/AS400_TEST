**FREE
// Finds all the MOST repeating characters in a string (blanks are ignored, case is ignored)
// e.g. CALL MOSTREP PARM('PROGRAMMING')   -> R, G and M each appear twice
// Every character that ties for the highest count is reported

Dcl-Pi *N;
  inParm Char(32);
End-Pi;

Dcl-S upperStr Char(32);
Dcl-S chr      Char(1);
Dcl-S chars    Char(1) Dim(32);
Dcl-S cnt      Int(5)  Dim(32);
Dcl-S n        Int(5)  Inz(0);
Dcl-S len      Int(5);
Dcl-S i        Int(5);
Dcl-S j        Int(5);
Dcl-S found    Ind;
Dcl-S maxCnt   Int(5)  Inz(0);
Dcl-S list     Varchar(32) Inz('');
Dcl-S outLine  Varchar(50);

Dsply 'Enter a String: ' '' inParm;

upperStr = %xlate('abcdefghijklmnopqrstuvwxyz':'ABCDEFGHIJKLMNOPQRSTUVWXYZ':inParm);
len = %len(%trimr(upperStr));

// Build a table of the distinct characters and how often each one occurs
i = 1;
Dow i <= len;
  chr = %subst(upperStr:i:1);

  if chr <> ' ';
    found = *Off;
    j = 1;
    Dow j <= n and not found;
      if chars(j) = chr;
        cnt(j) += 1;
        found = *On;
      endif;
      j += 1;
    Enddo;

    if not found;
      n += 1;
      chars(n) = chr;
      cnt(n) = 1;
    endif;
  endif;
  i += 1;
Enddo;

if n < 1;
  Dsply 'Pass a string with at least one character';
  *INLR = *On;
  Return;
endif;

j = 1;
Dow j <= n;
  if cnt(j) > maxCnt;
    maxCnt = cnt(j);
  endif;
  j += 1;
Enddo;

j = 1;
Dow j <= n;
  if cnt(j) = maxCnt;
    list += chars(j);
  endif;
  j += 1;
Enddo;

outLine = 'Most repeated (x' + %char(maxCnt) + '): ' + list;
Dsply outLine;

*INLR = *On;
