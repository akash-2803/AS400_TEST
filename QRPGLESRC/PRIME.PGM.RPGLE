**FREE
// Determines whether an entered number is PRIME or NOT
Dcl-S num     Packed(9:0);
Dcl-S i       Int(10);
Dcl-S isPrime Ind Inz(*On);

Dsply 'Enter a number:' '' num;

if num <= 1;
  isPrime = *Off;
else;
  i = 2;
  Dow i * i <= num and isPrime;
    if %rem(num:i) = 0;
      isPrime = *Off;
    endif;
    i += 1;
  Enddo;
endif;

if isPrime;
  Dsply 'Prime';
else;
  Dsply 'Not Prime';
endif;

*INLR = *On;
