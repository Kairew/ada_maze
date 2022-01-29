with HAL.Bitmap;            use HAL.Bitmap;
package ball is

   protected Ball is
      function getBallPos return Point;
      procedure setBallPos(pos : in Point);
      
      function isOnFinish return Boolean;
      procedure setFinish(state : in Boolean);
   private
      ballPos : Point;
      finish : Boolean;
   end Ball;
   

end ball;
