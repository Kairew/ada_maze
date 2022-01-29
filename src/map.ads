with HAL.Bitmap; use HAL.Bitmap;
package Map is
   -- W : Wall
   -- P : Path
   -- S : Start
   -- F : Finish
   type TileType is (W, P, H, S, F);
   type Row is array (1 .. 12) of TileType;
   type Map is array (1 .. 16) of Row;

   type MapArray is array (1 .. 3) of Map;


   M_Test : constant Map := ((W, W, W, W, W, W, W, W, W, W, W, W),
                             (W, W, P, P, P, W, W, W, P, P, P, W),
                             (W, W, P, W, P, P, W, P, P, P, P, W),
                             (W, W, P, W, P, P, W, P, P, W, P, W),
                             (W, W, P, W, P, P, W, P, P, W, P, W),
                             (W, W, P, W, P, W, W, W, P, W, P, W),
                             (W, P, P, P, P, P, P, P, P, W, P, W),
                             (W, P, W, P, W, W, W, W, P, W, P, W),
                             (W, P, W, P, P, W, P, P, P, W, P, W),
                             (W, P, W, P, P, P, P, W, P, W, P, W),
                             (W, P, W, W, W, W, W, W, W, W, P, W),
                             (W, P, P, P, P, P, W, P, P, P, P, W),
                             (W, W, W, W, P, P, W, W, W, P, W, W),
                             (W, P, P, P, P, P, W, P, P, P, P, W),
                             (W, S, P, P, P, P, W, F, P, P, P, W),
                             (W, W, W, W, W, W, W, W, W, W, W, W));

   M_Hole : constant Map := ((W, W, H, W, W, W, W, W, W, W, W, W),
                             (W, W, P, P, P, P, H, P, P, P, H, W),
                             (W, W, P, P, H, P, P, P, H, P, F, W),
                             (W, H, P, H, W, W, W, W, W, W, W, W),
                             (W, H, P, H, W, W, W, W, W, W, W, W),
                             (W, W, P, P, P, W, W, W, W, W, W, W),
                             (W, W, P, P, P, P, P, W, W, W, W, W),
                             (W, W, W, W, W, P, P, P, H, P, P, W),
                             (W, W, W, W, W, H, P, P, P, P, P, W),
                             (W, W, W, W, W, W, W, W, W, W, P, W),
                             (W, W, W, W, W, W, W, W, W, W, P, W),
                             (W, W, W, P, P, P, P, P, H, W, P, W),
                             (W, W, W, P, P, W, H, P, W, W, P, W),
                             (W, P, P, P, P, W, H, P, P, P, P, W),
                             (W, S, P, P, P, W, W, W, W, W, W, W),
                             (W, W, W, W, W, W, W, W, W, W, W, W));


    M_H : constant Map := ((W, W, W, W, W, P, W, W, W, W, W, W),
                           (W, W, W, W, W, P, W, W, W, W, W, W),
                           (W, W, W, W, W, P, W, W, W, W, W, W),
                           (W, W, W, W, W, P, W, W, W, W, W, W),
                           (W, W, W, W, W, P, W, W, W, W, W, W),
                           (W, W, W, W, W, P, W, W, W, W, W, W),
                           (W, W, W, W, W, F, W, W, W, W, W, W),
                           (W, W, W, W, W, W, W, W, W, W, W, W),
                           (W, W, W, W, W, S, W, W, W, W, W, W),
                           (W, W, W, W, W, P, W, W, W, W, W, W),
                           (W, W, W, W, W, P, W, W, W, W, W, W),
                           (W, W, W, W, W, P, W, W, W, W, W, W),
                           (W, W, W, W, W, P, W, W, W, W, W, W),
                           (W, W, W, W, W, P, W, W, W, W, W, W),
                           (W, W, W, W, W, P, W, W, W, W, W, W),
                           (W, W, W, W, W, P, W, W, W, W, W, W));

   currMap : Map := M_H;

   -- Check whether a TileType T is unique in a given board.
   function isUnique(M : Map; T : TileType) return Boolean
     with Pre => (T = S or T = F), Post => isUnique'Result = True;
   procedure DrawMap(M : in Map)
     with Pre => isUnique(M, S) and isUnique(M, F);

   -- B : Blue
   -- R : Red
   -- Y : Yellow
   -- O : Orange
   type Color is (B, R, O, Y);
   type TileRow is array (1 .. 20) of Color;
   type Tile is array (1 .. 20) of TileRow;

   Start : constant Tile := ((O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O),
                             (O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O),
                             (O, O, O, O, O, O, O, O, B, B, B, B, B, O, O, O, O, O, O, O),
                             (O, O, O, O, O, O, O, B, B, B, B, B, B, B, O, O, O, O, O, O),
                             (O, O, O, O, O, O, B, B, B, B, B, B, B, O, O, O, O, O, O, O),
                             (O, O, O, O, O, B, B, B, B, O, O, O, O, O, O, O, O, O, O, O),
                             (O, O, O, O, O, B, B, B, B, O, O, O, O, O, O, O, O, O, O, O),
                             (O, O, O, O, O, B, B, B, B, O, O, O, O, O, O, O, O, O, O, O),
                             (O, O, O, O, O, O, B, B, B, B, B, B, O, O, O, O, O, O, O, O),
                             (O, O, O, O, O, O, O, B, B, B, B, B, B, O, O, O, O, O, O, O),
                             (O, O, O, O, O, O, O, O, B, B, B, B, B, B, O, O, O, O, O, O),
                             (O, O, O, O, O, O, O, O, O, O, O, B, B, B, B, O, O, O, O, O),
                             (O, O, O, O, O, O, O, O, O, O, O, B, B, B, B, O, O, O, O, O),
                             (O, O, O, O, O, O, O, O, O, O, O, B, B, B, B, O, O, O, O, O),
                             (O, O, O, O, O, O, B, B, B, B, B, B, B, B, O, O, O, O, O, O),
                             (O, O, O, O, O, B, B, B, B, B, B, B, B, O, O, O, O, O, O, O),
                             (O, O, O, O, O, O, B, B, B, B, B, B, O, O, O, O, O, O, O, O),
                             (O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O),
                             (O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O),
                             (O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O, O));


   Finish : constant Tile := ((Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y),
                              (Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y),
                              (Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, B, B, Y, Y, Y, Y, Y, Y),
                              (Y, Y, Y, Y, Y, Y, Y, Y, Y, B, B, B, B, B, Y, Y, Y, Y, Y, Y),
                              (Y, Y, Y, Y, Y, Y, Y, B, B, B, R, R, B, B, Y, Y, Y, Y, Y, Y),
                              (Y, Y, Y, Y, Y, B, B, B, R, R, R, R, B, B, Y, Y, Y, Y, Y, Y),
                              (Y, Y, Y, Y, B, B, R, R, R, R, R, R, B, B, Y, Y, Y, Y, Y, Y),
                              (Y, Y, Y, Y, Y, B, B, B, R, R, R, R, B, B, Y, Y, Y, Y, Y, Y),
                              (Y, Y, Y, Y, Y, Y, Y, B, B, B, R, R, B, B, Y, Y, Y, Y, Y, Y),
                              (Y, Y, Y, Y, Y, Y, Y, Y, Y, B, B, B, B, B, Y, Y, Y, Y, Y, Y),
                              (Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, B, B, Y, Y, Y, Y, Y, Y),
                              (Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, B, B, Y, Y, Y, Y, Y, Y),
                              (Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, B, B, Y, Y, Y, Y, Y, Y),
                              (Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, B, B, Y, Y, Y, Y, Y, Y),
                              (Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, B, B, Y, Y, Y, Y, Y, Y),
                              (Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, B, B, Y, Y, Y, Y, Y, Y),
                              (Y, Y, Y, Y, Y, Y, Y, Y, Y, B, B, B, B, B, B, B, B, Y, Y, Y),
                              (Y, Y, Y, Y, Y, Y, Y, Y, Y, B, B, B, B, B, B, B, B, Y, Y, Y),
                              (Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y),
                              (Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y, Y));

   procedure DrawStart(I : in Integer; J : in Integer)
     with Pre => (J >= 0 and J < 16) and (I >= 0 and I < 12);
   procedure DrawFinish(I : in Integer; J : in Integer)
     with Pre => (J >= 0 and J < 16) and (I >= 0 and I < 12);
   procedure DrawBall(M : in Map);
   function getStartPos(M : in Map) return Point
     with Pre => isUnique(M, S),
          Post => M(getStartPos'Result.Y/20+1)(getStartPos'Result.X/20+1) = S;

end Map;
