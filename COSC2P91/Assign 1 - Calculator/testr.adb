with Ada.Text_IO; use Ada.Text_IO;
with RATIONALS; use RATIONALS;

procedure TestR is

   Test : Rationals.RATIONAL;

begin

   Test := Rationals(2,6);
   Ada.Text_IO.Put("Test = ");
   Rational_IO.Put(Test);
   Text_IO.New_Line;

end TestR;
