with HAL.Bitmap;            use HAL.Bitmap;
with map; use Map;

package body ball is
   protected body Ball is
   function getBallPos return Point is
   begin
      return ballPos;
   end getBallPos;
   
      procedure setBallPos(pos : in Point) is
         x : Integer := (((pos.X / 20) ) mod 12) + 1;
         y : Integer := (((pos.Y / 20) ) mod 16) + 1;
      begin
         if currMap(y)(x) /= W then
            ballPos := ((pos.X mod 240), (pos.Y mod 320));
         end if;
         if currMap(y)(x) = F then
            finish := True;
         end if;
      end setBallPos;
      
      function isOnFinish return Boolean is
      begin
         return finish;
      end isOnFinish;
      
      procedure setFinish(state : in Boolean) is
      begin
         finish := state;
      end setFinish;
      
   end Ball;
begin
   Ball.setBallPos(getStartPos(currMap));
   Ball.setFinish(False);
end ball;
