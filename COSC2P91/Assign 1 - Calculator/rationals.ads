package RATIONALS is -- v.1.0 -- author: V. WOJCIK, 13 Jan 2004
   ----------------------------------------------------------------------------
   -------------
   type RATIONAL is private;
   RATIONAL_ERROR : exception;   -- raised by any subprogram below if
   --denominator = 0

   --  Constructors, Destructors, I/O Procedures:
   function RAT (N, D : Integer) return RATIONAL; -- may raise RATIONAL_ERROR
   function NUM (R : RATIONAL) return Integer;  -- returns numerator of a
   --rational
   function DEN (R : RATIONAL) return Integer;  -- returns denominator
   procedure GET (R : out RATIONAL); --  inputs rational number from keyboard
   procedure PUT (R : in RATIONAL); -- outputs rational number (normalized) to
   --screen

   --  Rational Arithmetic Procedures (may raise RATIONAL_ERROR if necessary):

   --function GCD (X, Y : NATURAL) return RATIONAL;   -- normalizes rational
   --number x/y
   function "+" (X, Y : RATIONAL) return RATIONAL;
   function "-" (X, Y : RATIONAL) return RATIONAL;
   function "*" (X, Y : RATIONAL) return RATIONAL;
   function "/" (X, Y : RATIONAL) return RATIONAL;

   --  Relational functions:

   function "=" (X, Y : RATIONAL) return Boolean;
   function NE (X, Y : RATIONAL) return Boolean; -- not equal
   function LT (X, Y : RATIONAL) return Boolean;   -- less than     ( TRUE if
   --X < Y  )
   function LE (X, Y : RATIONAL) return Boolean;   -- less equal    ( TRUE if
   --X <= Y )
   function GT (X, Y : RATIONAL) return Boolean;   -- greater than  ( TRUE if
   --X > Y  )
   function GE (X, Y : RATIONAL) return Boolean;   -- greater equal ( TRUE if
   --X >= Y )

private  ----------------------------------------------------------------------
   -----------
   type RATIONAL is record
      NUM : Integer; -- numerator
      DEN : Integer; -- denominator (cannot be zero! - see exception above)
   end record;
   ----------------------------------------------------------------------------
   -------------
end RATIONALS;
