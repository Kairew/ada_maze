with HAL.Bitmap;            use HAL.Bitmap;

package body ball is
   function getBallPos return Point is
   begin
      return ballPos;
   end getBallPos;
   
   procedure setBallPos(pos : in Point) is
   begin
      ballPos := pos;
   end setBallPos;
   
begin
   ballPos := (20, 20);
end ball;
