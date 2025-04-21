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
procedure agregarClientes(l: listaClientes); //se dispone

procedure agregar(var l: listaCompras; c: compra);
var
 nuevo: listaCompras;
begin
    new(nuevo);
    nuevo^.dato:= c;
    nuevo^.sig:= l;
    l:= nuevo;
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
        while ((l1<>nil)and(dniActual = l1^.dato.dni)) do begin	//Procesa el dni actual
            cantCompras:= cantCompras + 1;
            monto:= monto + l1^.dato.monto;
	    l1 := l1^.sig;
        end;
        if (cantCompras > 5) then begin	//Clasifica la compra
		c.dni:= dniActual;
		c.cant:= cantCompras;
		c.montoTotal:= monto;
          	agregar(l2, c);
        end;
    end;
end;

var
l1: listaClientes;
l2: listaCompras;
begin
    l1:= nil;
    l2:= nil;
    agregarClientes(l1);	//Se dispone y se carga la estructura
    agregarCompras(l1, l2);	//Se crea nueva estructura
end.
    
