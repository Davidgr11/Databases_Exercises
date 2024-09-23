import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.JTextPane;
import javax.swing.JList;
import javax.swing.JComboBox;
import javax.swing.DefaultComboBoxModel;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JButton;
import java.awt.Color;

public class Consultas extends JFrame {

	private JPanel contentPane;
	private JLabel LabelNombreUsuario;
	private JLabel LabelEdad;
	private JLabel LabelFechaNacimiento;
	private JLabel LabelFechaCompleta;
	private JLabel LabelEdadMod;
	private JLabel LabelClave;
	private JComboBox comboBoxVacunas;
	private JTextPane textPane;
	private String vac;

	
	
	//Tafoya Lozano Lizeth Guadalupe
	//Tapia Valeria
	//Pedroza Díaz Leonardo
	
	
	
	/**
	 * Launch the application.
	 */
	/*
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Consultas frame = new Consultas();
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
	public Consultas(Persona per) {
		
	
		
		
		
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 470, 608);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(255, 204, 102));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		LabelNombreUsuario = new JLabel("Nombre usuario");
		LabelNombreUsuario.setFont(new Font("Lucida Fax", Font.PLAIN, 18));
		LabelNombreUsuario.setBounds(134, 37, 211, 23);
		contentPane.add(LabelNombreUsuario);
		
		
		LabelEdad = new JLabel("Edad:");
		LabelEdad.setForeground(new Color(204, 51, 0));
		LabelEdad.setFont(new Font("Lucida Fax", Font.PLAIN, 18));
		LabelEdad.setBounds(31, 69, 69, 28);
		contentPane.add(LabelEdad);
		
		LabelFechaNacimiento = new JLabel("Fecha de nacimiento:");
		LabelFechaNacimiento.setForeground(new Color(204, 51, 0));
		LabelFechaNacimiento.setFont(new Font("Lucida Fax", Font.PLAIN, 18));
		LabelFechaNacimiento.setBounds(31, 95, 211, 55);
		contentPane.add(LabelFechaNacimiento);
		
		LabelFechaCompleta = new JLabel("D\u00EDa");
		LabelFechaCompleta.setFont(new Font("Lucida Fax", Font.PLAIN, 18));
		LabelFechaCompleta.setBounds(252, 116, 137, 13);
		contentPane.add(LabelFechaCompleta);
		
		LabelClave = new JLabel("Clave");
		LabelClave.setFont(new Font("Lucida Fax", Font.PLAIN, 18));
		LabelClave.setBounds(353, 10, 83, 23);
		contentPane.add(LabelClave);
		
		LabelEdadMod = new JLabel("Edad:");
		LabelEdadMod.setFont(new Font("Lucida Fax", Font.PLAIN, 18));
		LabelEdadMod.setBounds(93, 69, 32, 28);
		contentPane.add(LabelEdadMod);
		
		//Cambios de etiqueta
		LabelNombreUsuario.setText(per.getNombre()+"  "+per.getApellido());
		String e,d,m,a,c;
		
		e = String.valueOf(per.getEdad());
		d= String.valueOf(per.getDia());
		m= String.valueOf(per.getMes());
		a =String.valueOf(per.getAnio());
		c= String.valueOf(per.getClave());
		
		LabelEdadMod.setText(e);
		LabelFechaCompleta.setText(d+" /"+m+" /"+a);
		LabelClave.setText(c);
		
		textPane = new JTextPane();
		textPane.setBackground(new Color(255, 255, 204));
		textPane.setEditable(false);
		textPane.setBounds(31, 201, 211, 332);
		contentPane.add(textPane);
		
		textPane.setText(per.getVacuna());
		
		comboBoxVacunas = new JComboBox();
		comboBoxVacunas.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				
				int num;
				
				num = comboBoxVacunas.getSelectedIndex();
				vac=comboBoxVacunas.getModel().getElementAt(num).toString();
				System.out.println(vac);
				
				
			}
		});
		comboBoxVacunas.setFont(new Font("Georgia", Font.PLAIN, 12));
		comboBoxVacunas.setModel(new DefaultComboBoxModel(new String[] {"Hepatitis B 1", "Hepatitis B 2", "Hepatitis B 3", "Rotavirus 1", "Rotavirus 2", "Rotavirus 3", "Influenza 1", "Influenza 2", "Influenza Refuerzo", "Rubeola 1", "Rubeola 2", "Difteria-Tetanos-Pertussis 1", "Difteria-Tetanos-Pertussis 2", "Difteria-Tetanos-Pertussis 3", "Difteria-Tetanos-Pertussis 4", "Virus del Papiloma Humano 1", "Virus del Papiloma Humano 2", "Virus del Papiloma Humano 3", "Varicela 1", "Varicela 2", "Varicela 3"}));
		comboBoxVacunas.setMaximumRowCount(21);
		comboBoxVacunas.setBounds(294, 205, 155, 31);
		contentPane.add(comboBoxVacunas);
		
		JLabel LabelVacunas = new JLabel("Vacunas Aplicadas");
		LabelVacunas.setForeground(new Color(153, 51, 51));
		LabelVacunas.setFont(new Font("Lucida Fax", Font.PLAIN, 16));
		LabelVacunas.setBounds(57, 160, 170, 31);
		contentPane.add(LabelVacunas);
		
		JLabel lblNewLabel = new JLabel("Vacunas por aplicar");
		lblNewLabel.setForeground(new Color(153, 51, 0));
		lblNewLabel.setFont(new Font("Lucida Fax", Font.PLAIN, 15));
		lblNewLabel.setBounds(294, 183, 162, 13);
		contentPane.add(lblNewLabel);
		
		JButton btnNewButton = new JButton("Agregar");
		btnNewButton.setBackground(new Color(255, 153, 102));
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				String concatenado;
				
				int c;
				c=per.getClave();
				
				
			 per.setVacuna(per.getVacuna().concat("\n"+vac));
			 concatenado =per.getVacuna();
				
			    Save s= new Save();
			    
			    System.out.println(concatenado);
			    s.GuardarVacuna(c,concatenado);
			
				System.out.println(per.getVacuna());
				
				textPane.setText(per.getVacuna());
				
			}
		});
		btnNewButton.setFont(new Font("Georgia", Font.PLAIN, 12));
		btnNewButton.setBounds(327, 257, 83, 21);
		contentPane.add(btnNewButton);
		
		JButton ButtonSalir = new JButton("Salir");
		ButtonSalir.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				Main m = new Main();
				
				m.setVisible(true);
				
				dispose();
				
			}
		});
		ButtonSalir.setBackground(new Color(255, 153, 102));
		ButtonSalir.setFont(new Font("Georgia", Font.PLAIN, 18));
		ButtonSalir.setBounds(361, 515, 75, 23);
		contentPane.add(ButtonSalir);
		
		JLabel lblNewLabel_1 = new JLabel("Usuario: ");
		lblNewLabel_1.setForeground(new Color(204, 51, 51));
		lblNewLabel_1.setFont(new Font("Lucida Fax", Font.PLAIN, 18));
		lblNewLabel_1.setBounds(31, 38, 95, 21);
		contentPane.add(lblNewLabel_1);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
