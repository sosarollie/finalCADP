program batallanaval;
type

vColumnas = array [1..15] of boolean;
vTablero = array [1..20] of vColumnas;

procedure inicializarTablero (var tablero: vTablero);
var
 i,j: integer;
begin
    for i:= 1 to 20 do
        for j:= 1 to 15 do
            tablero[i].[j]:= false;
        end,
    end;
end;


procedure poblarTablero (var tablero : vTablero);
var
 i: integer;
 fila,columna: integer;
begin
    for i:= 1 to 7 do begin
        writeln('Ingrese la fila a posicionar barco');
        read(fila);
        writeln('Ingrese la columna');
        read(columna);
        tablero[fila].[columna] := true;
    end;
end;

function dameNumeroFila(): integer; //se dispone
function dameNumeroColumna(): integer; //se dispone

procedure juego (var tablero: vTablero; fila,columna: integer; var golpe: boolean);
begin
 if (tablero[fila].[columna] = true) then
    tablero[fila].[columna] = false;
 end;
end;
    
var
 tablero1, tablero2: vTablero;
 puntaje1, puntaje2, fila, columna i: integer;
begin
 // se inicializan y se pueblan los tableros
 inicializarTablero(tablero1);
 inicializarTablero(tablero2);
 poblarTablero(tablero1);
 poblarTablero(tablero2);
 puntaje1:= 0;
 puntaje2:= 0;
 
 //comienza el juego
 for i:= 1 to 10 do begin
    // turno jugador 1
    fila:= dameNumeroFila();
    columna:= dameNumeroColumna();
    juego(tablero2, fila, columna, golpe);
    if (golpe = true) then
        puntaje1:= puntaje1 + 1;
    //turno jugador 2
    fila:= dameNumeroFila();
    columna:= dameNumeroColumna();
    juego(tablero1, fila, columna, golpe);
    if (golpe = true) then
    puntaje2:= puntaje2 + 1;
end;
writeln ('El jugador 1 ha hundido ' + puntaje1 + ' barcos!');
writeln ('El jugador 2 ha hundido ' + puntaje2 + ' barcos!');
end.
