with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body RATIONALS is
   type RATIONALS is
      record
         Num : Integer;
         Den : Integer;
      end record;
   function GCD (X, Y : NATURAL) return INTEGER is
      X1 : INTEGER := X;
      Y1 : INTEGER := Y;
   begin
      while ( Y1 /= 0 )loop
         X1 := Y1;
         Y1 := X1 mod Y1;
      end loop;
      return X1;
   end GCD;

   function RAT (N, D : INTEGER) return RATIONAL is
      G : NATURAL := GCD(abs N, D);
   begin
      return(RATIONAL'(NUM=>N/G, DEN=>D/G));
   end RAT;
   function NUM (R : RATIONAL) return INTEGER is
   begin
      return R.NUM;
   end NUM;
   function DEN (R : RATIONAL) return INTEGER is
   begin
      return R.DEN;
   end DEN;
   procedure GET (R : out RATIONAL) is
      pragma Unreferenced (R);
      N : INTEGER;
      D : INTEGER;
   begin
      Ada.Text_IO.Put("Enter a Numerator: ");
      Ada.Integer_Text_IO.Get(N);
      Ada.Text_IO.Put("Enter a Denominator: ");
      Ada.Integer_Text_IO.Get(D);
   end GET;
   procedure PUT (R : in RATIONAL) is
   begin
      null;
   end PUT;
   function "+" (X, Y : RATIONAL) return RATIONAL is
      N : INTEGER;
      D : INTEGER;
   begin
      N := NUM(X)*DEN(Y)+NUM(Y)*DEN(X);
      D := DEN(X)*DEN(Y);
      --NUM : INTEGER := X.NUM*Y.DEN + Y.NUM*X.DEN;
      --DEN : INTEGER := Y.DEN*X.DEN;
      return X/Y ;
   end "+";
   function "-" (X, Y : RATIONAL) return RATIONAL is
   begin
      return X - Y;
   end "-";
   function "*" (X, Y : RATIONAL) return RATIONAL is
   begin
      return((X.NUM*Y.NUM) / (Y.DEN*X.DEN));
   end "*";
   function "/" (X, Y : RATIONAL) return RATIONAL is
   begin
      return ((X.NUM*Y.DEN) / (X.DEN*Y.NUM));
   end "/";
   function "=" (X, Y : RATIONAL) return BOOLEAN is --=
   begin
      if X.DEN = Y.DEN and then X.NUM = Y.NUM then
         return True;
      end if;
   end "=";
   function NE  (X, Y : RATIONAL) return BOOLEAN is --/=
   begin
      return(X.NUM*Y.DEN = Y.NUM*X.DEN);
   end NE;
   function LT  (X, Y : RATIONAL) return BOOLEAN is --<
   begin
      return NUM(X)*DEN(Y) < NUM(Y)*DEN(X);
   end LT;
   function LE  (X, Y : RATIONAL) return BOOLEAN is --<=
   begin
      return not(Y < X);
   end LE;
   function GT  (X, Y : RATIONAL) return BOOLEAN is -->
   begin
      return (Y < X);
   end GT;
   function GE  (X, Y : RATIONAL) return BOOLEAN is -->=
   begin
      return not(X > Y);
   end GE;

end RATIONALS;
