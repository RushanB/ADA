with Ada.Text_IO;
with Ada.Integer_Text_IO;
with DoubleL;             use DoubleL;

procedure Test_DoubleL is
   TestList : Dlist;
   type IntegerArray is array (1 .. 6) of Integer;
   TestArray : IntegerArray := (6,5,2,-2,1,7);
begin
   Start(TestList);
   Ada.Text_IO.Put ("Press Enter to Start");
   Ada.Text_IO.Skip_Line;
   Ada.Text_IO.New_Line;
   Ada.Integer_Text_IO.Default_Width := 1;
   for L in TestArray'Range loop --Inserts TestArray to List
      Ada.Text_IO.Put ("Inserts ");
      Ada.Integer_Text_IO.Put (TestArray(L));
      Ada.Text_IO.Put (" into the List. Press Enter to Continue");
      Ada.Text_IO.New_Line;
      Insertion (TestList, TestArray(L));
      Contents (TestList);
      Ada.Text_IO.Skip_Line;
   end loop;

end Test_DoubleL;
