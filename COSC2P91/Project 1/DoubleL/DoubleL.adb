with Ada.Text_IO;use  Ada.Text_IO;
with Ada.Integer_Text_IO;use Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation;

package body DoubleL is
--Adas Free procedure
   procedure Free is
     new Ada.Unchecked_Deallocation (Dnode, Dptr);
--Makes the head of the list to null to start the List
   procedure Start (L : in out Dlist) is
   begin
      L.Head := null;
   end Start;
--Shows the Contents of the List in order
   procedure Contents (L : in Dlist) is
      Temp : Dptr;
   begin
      Temp := L.Head; --points to head of the List
      while Temp /= null loop
         Put (Temp.Element);
         Put (",");
         Temp := Temp.Next; --points to next node in the List
      end loop;
      New_Line;
   end Contents;
--Inserts Elements into the List
   procedure Insertion (L : in out Dlist; Element : in SubElement) is
      Temp : Dptr;
      Current : Dptr;
      Previous : Dptr;
   begin
      Temp := new Dnode;
      Temp.Element := Element;
      Current := L.Head;
      Previous := null;
      if isEmpty(L) then --if List is empty, it creates a new node
         L.Head := Temp;
         Temp.Next := null;
         Temp.Prev := null;
      elsif Temp.Element > L.Head.Element then --if List is not empty, insert at the front
         L.Head.Prev := Temp;
         Temp.Next := L.Head;
         L.Head := Temp;
         Temp.Prev := null;
      else --if List is not empty, travese the List through
         while Temp.Element < Current.Element loop
            Previous := Current;
            Current := Current.Next; --At end of List, current is null
            if Current = null then exit;   --Exit to avoid Pointer Error
            end if;
         end loop;
      Temp.Next := Current;
      Temp.Prev := Previous;
      Previous.Next := Temp;
         if Current /= null then --At end of List, node cannot be inserted
            Current.Prev := Temp;
         end if;
      end if;
   end Insertion;
--makes Head of List null if List is empty
   function isEmpty (L : in Dlist) return Boolean is
   begin
      if L.Head = null then
         return True;
      else
         return False;
      end if;
   end isEmpty;
--makes memory availabe for manipulation
   procedure Empty (L : in out Dlist) is
      Temp : Dptr;
   begin
      loop
         exit when isEmpty(L);
         Temp := L.Head;
         L.Head := Temp.Next;
         Free(Temp);
      end loop;
      L.Head := null;
   end Empty;

end DoubleL;
