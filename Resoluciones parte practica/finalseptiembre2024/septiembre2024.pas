program empresaFinal;
type

    rango = 1..100;

empleado = record
    DNI: integer;
    apellido: string[30];
    nombre: string[20];
    cod: rango;
    fecha: string[15];
    presente: boolean;
end;

listaEmpleados = ^nodo;
nodo = record
    dato: empleado;
    sig: listaEmpleados;
end;

procedure leerEmpleado(var e: empleado); //se dispone
procedure agregarAdelante(l: listaEmpleados; e: empleado); //se dispone
procedure cargarEmpleados(l: listaEmpleados); //se dispone

procedure maxEmpleadosPresentes(l: listaEmpleados);
var
 codActual: rango;
 maxDepartamento: rango;
 cantMaxDepartamento, cantActual: integer;
begin
    cantMaxDepartamento:= 0;
    maxDepartamento:=01;
    while (l <> nil) do begin
        cantActual:= 0;
        codActual:= l^.dato.cod;
        while (l <> nil) and (l^.dato.cod = codActual) do begin
            if (l^.dato.presente = true) then
                cantActual:= cantActual + 1;
            l:= l^.sig;
        end;
        if (cantActual > cantMaxDepartamento) then
            maxDepartamento:= codActual;
    end;
    writeln('El codigo del departamento con la mayor cantidad de empleados presentes en el periodo es', maxDepartamento);
end;
var
 l: listaEmpleados;
begin
 l:= nil;
 cargarEmpleados(l);
 maxEmpleadosPresentes(l);
end.
