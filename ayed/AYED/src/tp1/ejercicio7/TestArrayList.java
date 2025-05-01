package tp1.ejercicio7;

import java.util.*;

public class TestArrayList {
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		
		List <Integer> listaNumeros = new ArrayList();
		int numero = s.nextInt();
		while (numero != 0) {
			listaNumeros.add(numero);
			numero = s.nextInt();
		}
		
		for(Integer i : listaNumeros) {
			System.out.println(i);
		}
		
		/*			PUNTO B
		  El método de acceso de la ArrayList es directo, en cambio en un LinkedList es secuencial por lo q la vuelve mas ineficiente. Por ejemplo para imprimir el ultimo elemento de la lista deberiamos haber recorrido todos los nodos anteriores.
		 */
		
		System.out.println("---------------INICIO PUNTO C------------------");
		 for(int i: listaNumeros)
	            System.out.println(i);
	        
	        System.out.println("-------------------");
	        
	        Iterator<Integer> it = listaNumeros.iterator();
	        while(it.hasNext()) 
	            System.out.println(it.next());
	        
	        System.out.println("-------------------");
	        
	        for(int i = 0; i < listaNumeros.size(); i++)
	            System.out.println(listaNumeros.get(i));
	        
	    System.out.println("-----------------FIN PUNTO C----------------------");
		
	    
	    List <Estudiante> arrayEstudiantes = new ArrayList();
	    
	    for (int i = 0; i < 3; i++) {
	    	Estudiante estudiante = new Estudiante();
	    	estudiante.setApellido("Apellido " + i);
	    	estudiante.setNombre("Nombre " + i);
	    	estudiante.setComision("Comision " + i);
	    	estudiante.setDireccion("Direccion " + i);
	    	estudiante.setMail("Mail " + i);
	    	
	    	arrayEstudiantes.add(estudiante);
	    }
	    
	    System.out.println("Impresion ORIGINAL");
        for(Estudiante i : arrayEstudiantes) {
            System.out.println("Apellido: " + i.getApellido());
        }

        List <Estudiante> listaCopia = new ArrayList(arrayEstudiantes);

        System.out.println("Impresion COPIA");
        for(Estudiante i : listaCopia) {
            System.out.println("Apellido: " + i.getApellido());
        }

        System.out.println("MODIFICANDO DATOS DE LOS ESTUDIANTES...");

        arrayEstudiantes.get(1).setApellido("Sanchez");
        arrayEstudiantes.get(2).setApellido("Karle");

        System.out.println("Impresion ORIGINAL");
        for(Estudiante i : arrayEstudiantes) {
            System.out.println("Apellido: " + i.getApellido());
        }

        System.out.println("Impresion COPIA");
        for(Estudiante i : listaCopia) {
            System.out.println("Apellido: " + i.getApellido());
        }
	    
	    /*¿Qué conclusiones obtiene a partir de lo realizado? 
        Se copia los valores de referencia de la lista, por lo que cualquier cambio infiere en las dos listas. */
        
        /*¿Cuántas formas de copiar una lista existen? ¿Qué diferencias existen entre ellas? 
        1. Crear, mediante su constructor, un nuevo ArrayList pasando la lista original como argumento al constructor.
 			ArrayList<String> peliculas_copiadas1 = new ArrayList<String>(peliculas);
 			
 		2. Crear un nuevo ArrayList y agregar todos los elementos del original usando el método addAll().
 			ArrayList<String> peliculas_copiadas2 = new ArrayList<>();
			peliculas_copiadas2.addAll(peliculas);
			
 		3. Clonar el ArrayList usando el método clone()
 			ArrayList<String> peliculas_clonadas = (ArrayList<String>)peliculas.clone();
 			El uso del clone() no se recomienda ya que se debe castear.
        */
        
        Estudiante puntoSieteDe = new Estudiante("yo", "conejo", "turno 2", "arrobamail", "lafacu");
        if (!arrayEstudiantes.contains(puntoSieteDe)) {
        	arrayEstudiantes.add(puntoSieteDe);
        } else {
        	System.out.println("El estudiante ya está en la lista.");
        }
	}
}
