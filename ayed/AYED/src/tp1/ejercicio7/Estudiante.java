package tp1.ejercicio7;

public class Estudiante {
	private String nombre;
	private String apellido;
	private String comision;
	private String mail;
	private String direccion;
	
	public Estudiante(String nombre, String apellido, String comision, String mail, String direccion) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.comision = comision;
		this.mail = mail;
		this.direccion = direccion;
	}
	
	public Estudiante() {
		// TODO Auto-generated constructor stub
	}

	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getComision() {
		return comision;
	}
	public void setComision(String comision) {
		this.comision = comision;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	
	public String tusDatos() {
		return (this.getApellido() + ", " + this.getNombre() + ". " + this.getMail() + ". " + this.getDireccion() + ". " + this.getComision());
 	}
	
}
