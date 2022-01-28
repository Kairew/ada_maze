with Last_Chance_Handler;
pragma Unreferenced (Last_Chance_Handler);

with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

with STM32.Device; use STM32.Device;
with STM32.Board;  use STM32.Board;

with STM32.GPIO; use STM32.GPIO;
with STM32.EXTI; use STM32.EXTI;
with Ada.Exceptions; use Ada.Exceptions;
with Ada.Real_Time; use Ada.Real_Time;

with LCD_Std_Out;

with L3GD20; use L3GD20;

package body gyro_demo is

   x, y, z : Float:= 0.0;
   x_ang, y_ang, z_ang : Float := 0.0;
   Delta_Time : Time_Span;
   Current_Time, Prev_Time : Time;

   procedure Gyro_Init is


      procedure Configure_Gyro;
      --  Configures the on-board gyro chip

      procedure Configure_Gyro_Interrupt;
   --  Configures the gyro's FIFO interrupt (interrupt #2) on the
   --  required port/pin for the F429 Discovery board. Enables the interrupt.
   --  See the F429 Disco User Manual, Table 6, pg 19, for the port/pin.

      --------------------
      -- Configure_Gyro --
      --------------------

      procedure Configure_Gyro is
      begin
         --  Init the on-board gyro SPI and GPIO. This is board-specific, not
         --  every board has a gyro. The F429 Discovery does, for example, but
         --  the F4 Discovery does not.
         STM32.Board.Initialize_Gyro_IO;

         Gyro.Reset;

         Gyro.Configure
           (Power_Mode       => L3GD20_Mode_Active,
            Output_Data_Rate => L3GD20_Output_Data_Rate_760Hz,
            Axes_Enable => L3GD20_Axes_Enable, Bandwidth => L3GD20_Bandwidth_1,
            BlockData_Update => L3GD20_BlockDataUpdate_Continous,
            Endianness       => L3GD20_Little_Endian,
            Full_Scale       => L3GD20_Fullscale_2000);

         Gyro.Enable_Low_Pass_Filter;
      end Configure_Gyro;

      ------------------------------
      -- Configure_Gyro_Interrupt --
      ------------------------------

      procedure Configure_Gyro_Interrupt is
      --  This is the required port/pin configuration on STM32F429 Disco
      --  boards for interrupt 2 on the L3GD20 gyro. See the F429 Disco
      --  User Manual, Table 6, pg 19.
      begin
         Enable_Clock (MEMS_INT2);
         Configure_IO (MEMS_INT2, (Mode => Mode_In, Resistors => Floating));

         Configure_Trigger (MEMS_INT2, Interrupt_Rising_Edge);
      end Configure_Gyro_Interrupt;


   begin
      Configure_Gyro;

      Configure_Gyro_Interrupt;

      Gyro.Set_FIFO_Mode (L3GD20_Stream_Mode);

   end Gyro_init;

   task body Gyro_Task is
   begin
      delay 1.0;
      Gyro_Init;
      Prev_Time := Clock;

   loop
      Gyro.Get_Raw_Angle_Rates (Axes);
      x := Float(Axes.X) * 2000.0 / 32768.0;
         y := Float(Axes.Y) * 2000.0 / 32768.0;
         z := Float(Axes.Z) * 2000.0 / 32768.0;

         Current_Time := Clock;

         Delta_Time := Current_Time - Prev_Time;
         if x < -10.0 or x > 10.0 then
            x_ang := x_ang + x * Float(To_Duration(Delta_Time));
         end if;
         if y < -10.0 or y > 10.0 then
            y_ang := y_ang + y * Float(To_Duration(Delta_Time));
         end if;

         LCD_Std_Out.Put (0, 60, Integer(x_ang)'Img & "  ");
         LCD_Std_Out.Put (0, 120, Integer(y_ang)'Img & "  ");
         if x_ang > 150.0 and y_ang > -100.0 and y_ang < 100.0 then
            LCD_Std_Out.Put(0, 220, "Down");
         elsif x_ang < -150.0 and y_ang > -100.0 and y_ang < 100.0 then
            LCD_Std_Out.Put(0, 220, "Up");
         elsif y_ang > 150.0 and x_ang > -100.0 and x_ang < 100.0 then
            LCD_Std_Out.Put(0, 220, "Right");
         elsif y_ang < -150.0 and x_ang > -100.0 and x_ang < 100.0 then
            LCD_Std_Out.Put(0, 220, "Left");
         else
            LCD_Std_Out.Put(0, 220, "Neutral");
         end if;


         Prev_Time := Current_Time;
         delay 0.1;
      end loop;
   end Gyro_Task;

begin
   Axes := (0, 0, 0);

end gyro_demo;
