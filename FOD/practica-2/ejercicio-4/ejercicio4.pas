{4. Se cuenta con un archivo de productos de una cadena de venta de alimentos congelados. 
De cada producto se almacena: código del producto, nombre, descripción, stock disponible, 
stock mínimo y precio del producto. 
Se recibe diariamente un archivo detalle de cada una de las 30 sucursales de la cadena. Se 
debe realizar el procedimiento que recibe los 30 detalles y actualiza el stock del archivo 
maestro. La información que se recibe en los detalles es: código de producto y cantidad 
vendida. Además, se deberá informar en un archivo de texto: nombre de producto, 
descripción, stock disponible y precio de aquellos productos que tengan stock disponible por 
debajo del stock mínimo. Pensar alternativas sobre realizar el informe en el mismo 
procedimiento de actualización, o realizarlo en un procedimiento separado (analizar 
ventajas/desventajas en cada caso). 
Nota: todos los archivos se encuentran ordenados por código de productos. En cada detalle 
puede venir 0 o N registros de un determinado producto.}
program ejercicio4;
const
	valorAlto = ;
type
	producto = record
		codigo: integer;
		nombre: string;
		descripcion: string;
		stockDisponible: integer;
		stockMinimo: integer;
		precio: real;
	end;
	
	infoDetalle = record
		codigo: integer;
		cantidadVendida: integer;
	end;
