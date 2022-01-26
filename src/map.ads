package Map is
    -- W : Wall
    -- P : Path
    -- S : Start
    -- F : Finish
    type TileType is (W, P, S, F);
    type Row is array (1 .. 12) of TileType;
    type Map is array (1 .. 16) of Row;

    M : constant Map := ((P, P, P, P, P, P, P, P, P, P, P, P),
                         (P, W, P, W, P, W, W, W, P, P, P, P),
                         (P, W, P, W, P, P, W, P, P, P, P, P),
                         (P, W, W, W, P, P, W, P, P, P, P, P),
                         (P, W, P, W, P, P, W, P, P, P, P, P),
                         (P, W, P, W, P, W, W, W, P, P, P, P),
                         (P, P, P, P, P, P, P, P, P, P, P, P),
                         (P, P, P, P, P, P, P, P, P, P, P, P),
                         (P, P, P, P, P, P, P, P, P, P, P, P),
                         (P, P, P, P, P, P, P, P, P, P, P, P),
                         (P, S, P, P, P, P, P, P, P, P, F, P),
                         (P, P, P, P, P, P, P, P, P, P, P, P),
                         (P, P, P, P, P, P, P, P, P, P, P, P),
                         (P, P, P, P, P, P, P, P, P, P, P, P),
                         (P, P, P, P, P, P, P, P, P, P, P, P),
                         (P, P, P, P, P, P, P, P, P, P, P, P));

    procedure DrawMap(M : in Map);

    -- B : Blue
    -- R : Red
    -- Y : Yellow
    -- O : Orange
    type Color is (B, R, Y, O);
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

    procedure DrawStart(I : in Integer; J : in Integer);
    procedure DrawFinish(I : in Integer; J : in Integer);

end Map;
