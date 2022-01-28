with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with STM32.Board;           use STM32.Board;
with HAL.Bitmap;            use HAL.Bitmap;
with LCD_Std_Out;
with ball;
package body Map is

   function isUnique(M : Map; T : TileType) return Boolean
   is
      Counter : Integer := 0;
   begin
      for I in 1 .. 12 loop
         for J in 1 .. 16 loop
            if M(J)(I) = T then
               if Counter = 1 then
                  return False;
               end if;
               Counter := Counter + 1;
            end if;
         end loop;
      end loop;
      return Counter = 1;
   end isUnique;

   procedure DrawStart(I : in Integer; J : in Integer) is
      I_New, J_New : Integer;
   begin
      for I_Offset in 1 .. 20 loop
         for J_Offset in 1 .. 20 loop
            I_New := I * 20 + I_Offset - 1;
            J_New := J * 20 + J_Offset - 1;
            case Start(J_Offset)(I_Offset) is
               when O => Display.Hidden_Buffer (1).Set_Source (HAL.Bitmap.Orange);
               when B => Display.Hidden_Buffer (1).Set_Source (HAL.Bitmap.Black);
               when others => null;
            end case;
            Draw_Line(Display.Hidden_Buffer (1).all,
                      Start => (I_New, J_New),
                      Stop =>  (I_New, J_New));
         end loop;
      end loop;
   end DrawStart;

   procedure DrawFinish(I : in Integer; J : in Integer) is
      I_New, J_New : Integer;
   begin
      for I_Offset in 1 .. 20 loop
         for J_Offset in 1 .. 20 loop
            I_New := I * 20 + I_Offset - 1;
            J_New := J * 20 + J_Offset - 1;
            case Finish(J_Offset)(I_Offset) is
               when B => Display.Hidden_Buffer (1).Set_Source (HAL.Bitmap.Black);
               when R => Display.Hidden_Buffer (1).Set_Source (HAL.Bitmap.Red);
               when Y => Display.Hidden_Buffer (1).Set_Source (HAL.Bitmap.Yellow);
               when others => null;
            end case;
            Draw_Line(Display.Hidden_Buffer (1).all,
                      Start => (I_New, J_New),
                      Stop =>  (I_New, J_New));
         end loop;
      end loop;
   end DrawFinish;

   -- Check there is exactly one start and one finish
   procedure DrawMap(M : in Map)
   is
   begin
      -- Draw map
      for I in 1 .. 12 loop
         for J in 1 .. 16 loop
            Display.Hidden_Buffer (1).Set_Source (HAL.Bitmap.Brown);
            case M(J)(I) is
               when W => Fill_Rect (Display.Hidden_Buffer (1).all,
                                    Area => (((I - 1) * 20, (J - 1) * 20), 20, 20));
               when S => DrawStart(I - 1, J - 1);
               when F => DrawFinish(I - 1, J - 1);
               when others => null;
            end case;
         end loop;
      end loop;
      Display.Update_Layer (1, Copy_Back => True);
   end DrawMap;

   procedure DrawBall(M : in Map) is
      ballPos : Point;
   begin
      ballPos := ball.getBallPos;

      Display.Hidden_Buffer (1).Set_Source (HAL.Bitmap.Green);
      Fill_Circle(Display.Hidden_Buffer(1).all, ballPos, 10);
      Display.Update_Layer (1, Copy_Back => False);
   end DrawBall;

end Map;
