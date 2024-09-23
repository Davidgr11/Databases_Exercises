import java.util.ArrayList;
import java.util.List;

//Tafoya Lozano Lizeth Guadalupe
//Tapia Valeria
//Pedroza Díaz Leonardo

public class Persona {
	
	private String nombre;
	private String apellido;
	private int edad;
	private int clave;
	private int dia, mes, anio;
	private String Vacuna;
	
	


	public Persona(String nombre, String apellido, int edad,int clave,int dia, int mes, int anio,String Vacuna )
	{
		this.nombre=nombre;
		this.apellido=apellido;
		this.edad=edad;
		this.clave=clave;
		this.dia=dia;
		this.mes=mes;
		this.anio=anio;
		this.Vacuna=Vacuna;
	}
	
	
	public Persona()
	{
		
	}
	
	
	public String getVacuna() {
		return Vacuna;
	}


	public void setVacuna(String vacuna) {
		Vacuna = vacuna;
	}

	
	public String getNombre() {
		return nombre;
	}


	public String getApellido() {
		return apellido;
	}


	public int getEdad() {
		return edad;
	}


	public int getClave() {
		return clave;
	}


	public int getDia() {
		return dia;
	}


	public int getMes() {
		return mes;
	}



	public int getAnio() {
		return anio;
	}





	public String toString() {
		   
		   return "Nombre: "+nombre+"\nApellido: "+apellido+"\nClave: "+clave+"\nEdad: "+edad+"\nFecha de nacimiento:"+dia+" /"+mes+" /"+anio;
	   } 
	
	
	
	

}
