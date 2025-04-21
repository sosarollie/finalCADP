program final1;
type

 rangoTema = 1..15;
 
 prestamo = record
	codT: rangoTema;
	fecha: string;
	codL: integer;
 end;
 
 lista = ^nodo;
 nodo = record
	dato: prestamo;
	sig: lista;
 end;
 
 
 procedure cargarLista(l: lista); //se dispone;
 
procedure recorrido (l: lista);
var
 temaActual, cantTotal, temaMax, cantMax: integer;
begin
 cantMax:= 0;
 while (l <> nil) do begin
	cantTotal:= 0;
	temaActual:= l^.dato.codT;
	while (l <> nil) and (temaActual = l^.dato.codT) do begin
		cantTotal:= cantTotal + 1;
		l:= l^.sig;
	end;
	if (cantTotal > cantmax) then begin
		cantMax:= cantTotal;
		temaMax:= temaActual;
	end;
 writeln('La cantidad para el tema ', temaActual, ' es ', cantTotal);
 end;
 writeln('El tema con mas cantidad de prestamos es el ', temaMax);
end;

var
 l: lista;
begin
 l:= nil;
 cargarLista(l);
 recorrido(l);
end.
	
