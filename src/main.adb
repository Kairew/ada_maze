with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
--  The "last chance handler" is the user-defined routine that is called when
--  an exception is propagated. We need it in the executable, therefore it
--  must be somewhere in the closure of the context clauses.

with STM32.Board;           use STM32.Board;
with HAL.Bitmap;            use HAL.Bitmap;
pragma Warnings (Off, "referenced");
with BMP_Fonts;
with LCD_Std_Out;
with Game;
with gyro_demo;

procedure Main is
begin

   Game.Play;

   loop
      --Display.Update_Layer (1, Copy_Back => True);
      delay 1.0;
   end loop;

end Main;
