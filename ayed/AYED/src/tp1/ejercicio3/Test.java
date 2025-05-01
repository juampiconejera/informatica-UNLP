package tp1.ejercicio3;

import java.util.Scanner;

public class Test {
	public static void main(String[] args) {
		
		Estudiante[] arrayEstudiantes = new Estudiante[2];
		Profesor[] arrayProfesor = new Profesor[3];
		
		Scanner s = new Scanner(System.in);
		
		for (int i = 0; i < 2; i++) {
			arrayEstudiantes[i] = new Estudiante();
			arrayEstudiantes[i].setApellido("a" + i);
			arrayEstudiantes[i].setNombre("a" + i);
			arrayEstudiantes[i].setMail("a" + i);
			arrayEstudiantes[i].setDireccion("a" + i);
			arrayEstudiantes[i].setComision("a" + i);
		}
		
		for (int i = 0; i < 3; i++) {
			arrayProfesor[i] = new Profesor();
			arrayProfesor[i].setApellido("b" + i);
			arrayProfesor[i].setNombre("b" + i);
			arrayProfesor[i].setMail("b" + i);
			arrayProfesor[i].setCatedra("b" + i);
			arrayProfesor[i].setFacultad("b" + i);
		}
		
		
		for (int i = 0; i < 2; i++) {
			System.out.println(arrayEstudiantes[i].tusDatos());
		}
		for (int i = 0; i < 3; i++) {
			System.out.println(arrayProfesor[i].tusDatos());
		}
	}
}
