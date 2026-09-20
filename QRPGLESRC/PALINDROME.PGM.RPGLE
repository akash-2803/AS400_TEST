**FREE
// Determines whether an entered string is a PALINDROME or NOT
// e.g. CALL PALINDROME PARM('MADAM')
Dcl-Pi *N;
  inParm Char(32);
End-Pi;

Dcl-S inStr    Char(50);
Dcl-S upperStr Char(50);
Dcl-S revStr   Char(50);
Dcl-S len      Int(5);
Dcl-S i        Int(5);

Dsply 'Enter a String: ' '' inParm;
inStr = inParm;

upperStr = %xlate('abcdefghijklmnopqrstuvwxyz':'ABCDEFGHIJKLMNOPQRSTUVWXYZ':inStr);
len = %len(%trimr(upperStr));

revStr = '';
i = 1;
Dow i <= len;
  %subst(revStr:i:1) = %subst(upperStr:len - i + 1:1);
  i += 1;
Enddo;

if %trimr(upperStr) = %trimr(revStr);
  Dsply 'Palindrome';
else;
  Dsply 'Not Palindrome';
endif;

*INLR = *On;
