program final2;
const
	dimF = 2000;
type
	factura = record
		num: integer;
		codC: integer;
		codS: integer;
		monto: real;
	end;
	
Vfacturas = array [1..2000] of factura;

procedure leerFactura (var f: factura); //se dispone
procedure agregarFactura (var v: Vfacturas; var dimL: integer); //se dispone

procedure recorrerVector (var v: Vfacturas; var dimL, codMayor: integer);
var
	i, codActual, cantMaxActual, cantActual: integer;
begin
	codActual:= v[1].codS;
	cantActual:= 0;
	for i:= 1 to dimL do begin
		if (codActual <> v[i].codS) then begin
			cantMaxActual:= cantActual;
			codMayor:= codActual;
			codActual:= v[i].codS;
			cantActual:= 1;
		end else
			cantActual:= cantActual + 1;
	end;
	writeln('La sucursal con mayor cantidad de facturas es la numero ', codMayor);
end;

var
v: Vfacturas;
dimL: integer;
codMayor: integer;

begin
dimL:= 0;
while (dimL < 100) do //carga facuras
		agregarFactura(v,dimL);
recorrerVector(v, dimL, codMayor);
end.
			
		
