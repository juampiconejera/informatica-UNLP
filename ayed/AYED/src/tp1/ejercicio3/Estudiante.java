package tp1.ejercicio3;

public class Estudiante {
	private String nombre;
	private String apellido;
	private String comision;
	private String mail;
	private String direccion;
	

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
