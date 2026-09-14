with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

procedure Recursions is

   subtype Positive_Integer is Integer range 1 .. 12;

   function Factorial (N : Positive_Integer) return Natural is
   begin
      if N = 1 then
         return 1;
      else
         return N * Factorial (N - 1);
      end if;
   end Factorial;

   N : Positive_Integer;

begin
   Put ("Enter a positive integer (1-12): ");
   Get (N);
   Put_Line (Integer'Image (N) & " ->" & Integer'Image (Factorial (N)));
end Recursions;
