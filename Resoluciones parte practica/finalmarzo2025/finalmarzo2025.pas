program finalcadpmar2025;
type
	rango = 1..5;

	factura = record
		num: integer;
		codSucursal: rango;
		montoTotal: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: factura;
		sig: lista;
	end;
	
procedure cargarLista (var l: lista); // se dispone

procedure eliminar(var l: lista);
var
 codigo: rango;
 ant, act: lista;
 montoFacturas: real;
begin
 montoFacturas:= 0;
 read(codigo); //se lee el codigo a eliminar
 act:= l;
 while (act <> nil) do begin
	while (act^.dato.codSucursal <> codigo) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act <> nil) then begin
		montoFacturas:= montoFacturas + act^.dato.montoTotal;
		if (act = l) then
			l:= act^.sig
		else
			ant^.sig:= act^.sig;
		dispose(act);
	end;
 end;
 writeln(montoFacturas);
end;

var
 l: lista;
begin
 l:= nil;
 cargarLista(l);
 eliminar(l);
end.
	
	
