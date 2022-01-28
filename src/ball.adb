with HAL.Bitmap;            use HAL.Bitmap;

package body ball is
   protected body Ball is
   function getBallPos return Point is
   begin
      return ballPos;
   end getBallPos;
   
   procedure setBallPos(pos : in Point) is
   begin
      ballPos := ((pos.X mod 220), (pos.Y mod 340));
   end setBallPos;
   end Ball;
begin
   Ball.setBallPos((20, 20));
end ball;
