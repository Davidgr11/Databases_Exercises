import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Font;
import javax.swing.JTextField;
import javax.swing.JButton;
import java.awt.Color;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.List;
import java.awt.event.ActionEvent;

//Tafoya Lozano Lizeth Guadalupe
//Tapia Valeria
//Pedroza Díaz Leonardo

public class Registro extends JFrame {

	private JPanel contentPane;
	private JTextField textFieldNombre;
	private JTextField textFieldApellido;
	private JTextField textFieldDia;
	private JTextField textFieldMes;
	private JTextField textFieldAnio;
	private JTextField textFieldEdad;
	private String nom,app,vac;
	private int edad,dia,mes,anio,clave;
	private JLabel LabelClave;
	private JTextField textFieldClave;
	private Save guardar = new Save();
	
	 

	/**
	 * Launch the application.
	 */
	/*public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Registro frame = new Registro();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public Registro() {
		
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 300);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(153, 204, 204));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel LabelRegistro = new JLabel("<< REGISTRO >>");
		LabelRegistro.setForeground(new Color(0, 51, 102));
		LabelRegistro.setFont(new Font("Georgia", Font.PLAIN, 17));
		LabelRegistro.setBounds(151, 10, 156, 26);
		contentPane.add(LabelRegistro);
		
		JLabel LabelNombre = new JLabel("Nombre");
		LabelNombre.setFont(new Font("Lucida Fax", Font.PLAIN, 12));
		LabelNombre.setBounds(23, 59, 59, 13);
		contentPane.add(LabelNombre);
		
		textFieldNombre = new JTextField();
		textFieldNombre.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				 nom= textFieldNombre.getText();
				
			}
		});
		textFieldNombre.setBounds(101, 57, 156, 19);
		contentPane.add(textFieldNombre);
		textFieldNombre.setColumns(10);
		
		JLabel LabelApellidos = new JLabel("Apellidos");
		LabelApellidos.setFont(new Font("Lucida Fax", Font.PLAIN, 12));
		LabelApellidos.setBounds(23, 92, 72, 13);
		contentPane.add(LabelApellidos);
		
		textFieldApellido = new JTextField();
		textFieldApellido.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				 app= textFieldApellido.getText();
			}
		});
		textFieldApellido.setBounds(101, 86, 156, 19);
		contentPane.add(textFieldApellido);
		textFieldApellido.setColumns(10);
		
		JLabel LabelFecha = new JLabel("Fecha de nacimiento");
		LabelFecha.setFont(new Font("Lucida Fax", Font.PLAIN, 12));
		LabelFecha.setBounds(23, 187, 143, 13);
		contentPane.add(LabelFecha);
		
		JLabel LabelDia = new JLabel("D\u00EDa");
		LabelDia.setFont(new Font("Lucida Fax", Font.PLAIN, 11));
		LabelDia.setBounds(176, 188, 43, 13);
		contentPane.add(LabelDia);
		
		JLabel LabelMes = new JLabel("Mes");
		LabelMes.setFont(new Font("Lucida Fax", Font.PLAIN, 11));
		LabelMes.setBounds(254, 188, 43, 12);
		contentPane.add(LabelMes);
		
		JLabel LabelAnio = new JLabel("A\u00F1o");
		LabelAnio.setFont(new Font("Lucida Fax", Font.PLAIN, 11));
		LabelAnio.setBounds(330, 188, 43, 13);
		contentPane.add(LabelAnio);
		
		textFieldDia = new JTextField();
		textFieldDia.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				String c;
				
				c= textFieldDia.getText();
				dia= Integer.parseInt(c);
			}
		});
		textFieldDia.setBounds(212, 185, 34, 19);
		contentPane.add(textFieldDia);
		textFieldDia.setColumns(10);
		
		textFieldMes = new JTextField();
		textFieldMes.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
                String c;
				
				c= textFieldMes.getText();
				mes= Integer.parseInt(c);
			}
		});
		textFieldMes.setBounds(288, 185, 34, 19);
		contentPane.add(textFieldMes);
		textFieldMes.setColumns(10);
		
		textFieldAnio = new JTextField();
		textFieldAnio.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
                String c;
				
				c= textFieldAnio.getText();
				anio= Integer.parseInt(c);
			}
		});
		textFieldAnio.setBounds(364, 185, 34, 19);
		contentPane.add(textFieldAnio);
		textFieldAnio.setColumns(10);
		
		JButton ButtonRegistrarse = new JButton("Registrarse");
		ButtonRegistrarse.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				textFieldNombre.setText(null);
				textFieldApellido.setText(null);
				textFieldEdad.setText(null);
				textFieldClave.setText(null);
				textFieldDia.setText(null);
				textFieldMes.setText(null);
				textFieldAnio.setText(null);
				
				String vac="";
				
				
				Persona per = new Persona(nom,app,edad,clave,dia,mes,anio,vac);
				
				Save s = new Save();
				s.Guardar(per);
				
			    System.out.println(per.toString());
			    
			    Principal p = new Principal();
			    JOptionPane.showMessageDialog(null,"Registro guardado");
			    
				dispose();
				
				p.setVisible(true);
			}
		});
		ButtonRegistrarse.setBackground(new Color(224, 255, 255));
		ButtonRegistrarse.setFont(new Font("Times New Roman", Font.PLAIN, 11));
		ButtonRegistrarse.setBounds(176, 220, 83, 21);
		contentPane.add(ButtonRegistrarse);
		
		JLabel lblNewLabel = new JLabel("Edad");
		lblNewLabel.setFont(new Font("Lucida Fax", Font.PLAIN, 12));
		lblNewLabel.setBounds(33, 121, 59, 13);
		contentPane.add(lblNewLabel);
		
		textFieldEdad = new JTextField();
		textFieldEdad.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				String c;
				
				c= textFieldEdad.getText();
				edad= Integer.parseInt(c);
			}
		});
		textFieldEdad.setBounds(101, 115, 43, 19);
		contentPane.add(textFieldEdad);
		textFieldEdad.setColumns(10);
		
		LabelClave = new JLabel("Clave");
		LabelClave.setFont(new Font("Lucida Fax", Font.PLAIN, 12));
		LabelClave.setBounds(32, 150, 81, 13);
		contentPane.add(LabelClave);
		
		textFieldClave = new JTextField();
		textFieldClave.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
               String c;
				
				c= textFieldClave.getText();
				clave= Integer.parseInt(c);
			}
		});
		textFieldClave.setBounds(101, 144, 86, 19);
		contentPane.add(textFieldClave);
		textFieldClave.setColumns(10);
	}
}
