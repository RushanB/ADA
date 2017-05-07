package DoubleL is

   subtype SubElement is Integer;
   type Dnode;
   type Dptr is access Dnode;

   type Dnode is record
      Element : SubElement;
      Next : Dptr;
      Prev : Dptr;
   end record;

   type Dlist is record
      Head : Dptr;
   end record;

   procedure Start (L : in out Dlist);
   --Starts the List by creating a Head

   procedure Contents (L : in Dlist);
   --Displays the Elements of the List as they are entered

   procedure Insertion (L : in out Dlist; Element : in SubElement);
   --Inserts elements into List in desired position

   function isEmpty (L : in Dlist) return Boolean;
   --True if List is empty, False otherwise

   procedure Empty (L : in out Dlist);
   --Checks to see if List exists or is empty

end DoubleL;
