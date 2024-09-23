import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Save {
	
public void Guardar(Persona per) {
		
		Connection con = Conexion.getInstance().connect;
		
		try {
			
			String sql = "INSERT INTO Usuarios (Nombre,Apellido,Clave,Edad,DiaNac,MesNac,AnhoNac,Vacunas) VALUES (?,?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, per.getNombre());
			ps.setString(2, per.getApellido());
			ps.setInt(3, per.getClave());
			ps.setInt(4, per.getEdad());
			ps.setInt(5, per.getDia());
			ps.setInt(6, per.getMes());
			ps.setInt(7, per.getAnio());
			ps.setString(8, per.getVacuna());
			ps.executeUpdate();
			
			}catch(Exception e1) {
				System.out.println("Error");
			}
		
	}


public Persona Consultar(int claveIn) {
	
	Connection con = Conexion.getInstance().connect;
	String nom,app,vacuna;
	int clave,dia,mes,anho,edad;
	
	
	
	try {
		
		String sql = "SELECT * FROM Usuarios";
		PreparedStatement ps=con.prepareStatement(sql);
		
		ResultSet res = ps.executeQuery();
		
        while(res.next()) {
			
        	if(res.getInt("Clave")==claveIn) {
        		
        		nom=res.getString("Nombre");
        		app=res.getString("Apellido");
        	    vacuna=res.getString("Vacunas");
        	    clave=res.getInt("Clave");
        	    dia=res.getInt("DiaNac");
        	    mes=res.getInt("MesNac");
        	    anho=res.getInt("AnhoNac");
        	    edad=res.getInt("Edad");
        	    
        	    
        	    
        	    Persona per = new Persona(nom,app,edad,clave,dia,mes,anho,vacuna);
        		 return per;
        		
        	}
		}
		
		}catch(Exception e1) {
			System.out.println("Error");
		}
	return null;
	
}

public void GuardarVacuna(int c,String concatenado) {
	
	Connection con = Conexion.getInstance().connect;
	
	
	try {
		
		String sql = "SELECT * FROM Usuarios";
		PreparedStatement ps=con.prepareStatement(sql);
		
		ResultSet res = ps.executeQuery();
		
        while(res.next()) {
			
        	if(res.getInt("Clave")==c) {
        		

        		String sql2 = "UPDATE Usuarios SET Vacunas = ?";
    			PreparedStatement ps2=con.prepareStatement(sql2);
    			ps2.setString(1, concatenado);
    			ps2.executeUpdate();
    		
        		
        	}
		}
		
		}catch(Exception e1) {
			System.out.println("Error al guardar vacunas");
		}
	
	
	
}
	
	
	
	
	

}
