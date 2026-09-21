**FREE
// Finds all the LEAST repeating characters in a string (blanks are ignored, case is ignored)
// e.g. CALL LEASTREP PARM('PROGRAMMING')  -> P, O, A, I and N each appear once
// Every character that ties for the lowest count is reported

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
Dcl-S minCnt   Int(5);
Dcl-S list     Varchar(32) Inz('');
Dcl-S outLine  Varchar(50);

Dsply 'Enter a String: ' '' inParm;

upperStr = %xlate('abcdefghijklmnopqrstuvwxyz':'ABCDEFGHIJKLMNOPQRSTUVWXYZ':inParm);
len = %len(%trimr(upperStr));

// Build a table of the distinct characters and how often each one occurs
For i = 1 to len;
  chr = %subst(upperStr:i:1);

  if chr <> ' ';
    found = *Off;
    For j = 1 to n;
      if chars(j) = chr;
        cnt(j) += 1;
        found = *On;
        Leave;
      endif;
    Endfor;

    if not found;
      n += 1;
      chars(n) = chr;
      cnt(n) = 1;
    endif;
  endif;
Endfor;

if n < 1;
  Dsply 'Pass a string with at least one character';
  *INLR = *On;
  Return;
endif;

minCnt = cnt(1);
For j = 2 to n;
  if cnt(j) < minCnt;
    minCnt = cnt(j);
  endif;
Endfor;

For j = 1 to n;
  if cnt(j) = minCnt;
    list += chars(j);
  endif;
Endfor;

outLine = 'Least repeated (x' + %char(minCnt) + '): ' + list;
Dsply outLine;

*INLR = *On;
