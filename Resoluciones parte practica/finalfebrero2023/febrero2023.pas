program febrero2023;
type

cliente = record
    dni: integer;
    fecha: string;
    monto: real;
    end;

compra = record
    dni: integer;
    cant: integer;
    montoTotal: real;
end;

listaClientes = ^nodo;
nodo = record
    dato: cliente;
    sig: listaClientes;
end;

listaCompras = ^nodo2;
nodo2 = record
    dato: compra;
    sig: listaCompras;
end;

procedure leerCliente (var c: cliente); //se dispone
procedure agregarClienteAtras(l: listaClientes); //se dispone

procedure agregarAtras(l: listaCompras; c: compra);
var
 nuevo: listaCompras;
begin
    new(nuevo);
    nuevo^.dato:= c;
    nuevo^.sig:= nil;
    l^.sig:= nuevo;
end;

procedure agregarCompras (l1: listaClientes; l2: listaCompras);
var
 cantCompras: integer;
 monto: real;
 dniActual: integer;
 c: compra;
begin
    while (l1 <> nil) do begin
        cantCompras:= 0;
        monto:= 0;
        dniActual:= l1^.dato.dni;
        while (dniActual = l1^.dato.dni) do begin
            cantCompras:= cantCompras + 1;
            monto:= monto + l1^.dato.monto;
        end;
        if (cantCompras > 5) then begin
			c.dni:= dniActual;
			c.cant:= cantCompras;
			c.montoTotal:= monto;
            agregarAtras(l2, c);
        end;
        l1:= l1^.sig;
    end;
end;

var
l1: listaClientes;
l2: listaCompras;
begin
    l1:= nil;
    l2:= nil;
    agregarClienteAtras(l1);
    agregarCompras(l1, l2);
end.
    
