with HAL.Bitmap;            use HAL.Bitmap;
with map; use Map;

package body ball is
   protected body Ball is
   function getBallPos return Point is
   begin
      return ballPos;
   end getBallPos;
   
      procedure setBallPos(pos : in Point) is
      begin
         if M_Test((pos.Y / 20) + 1)((pos.X / 20) + 1) /= W then
            ballPos := ((pos.X mod 220), (pos.Y mod 340));
         end if;
         if M_Test((pos.Y / 20) + 1)((pos.X / 20) + 1) = F then
            finish := True;
         end if;
      end setBallPos;
      
      function isOnFinish return Boolean is
      begin
         return finish;
      end isOnFinish;
      
   end Ball;
begin
   Ball.setBallPos(getStartPos(M_Test));
end ball;
