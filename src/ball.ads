with HAL.Bitmap;            use HAL.Bitmap;
package ball is

   pragma Elaborate_Body;
   function getBallPos return Point;
   procedure setBallPos(pos : in Point);
   
   
private
   ballPos : Point;

end ball;
