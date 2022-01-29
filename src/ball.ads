with HAL.Bitmap;            use HAL.Bitmap;
package ball is

   protected Ball is
      function getBallPos return Point;
      procedure setBallPos(pos : in Point);
      
      function isOnFinish return Boolean;
   private
      ballPos : Point;
      finish : Boolean := False;
   end Ball;
   

end ball;
