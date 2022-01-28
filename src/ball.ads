with HAL.Bitmap;            use HAL.Bitmap;
package ball is

   protected Ball is
      function getBallPos return Point;
      procedure setBallPos(pos : in Point);
   private
   ballPos : Point;

   end Ball;
   

end ball;
