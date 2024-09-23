import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Font;
import javax.swing.JPasswordField;
import java.awt.Color;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.ActionEvent;


//Tafoya Lozano Lizeth Guadalupe
//Tapia Valeria
//Pedroza Díaz Leonardo

public class Principal extends JFrame {

	private JPanel contentPane;
	private JPasswordField passwordField;
	private int clave;

	/**
	 * Launch the application.
	 *//*
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Principal frame2 = new Principal();
					frame2.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public Principal() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 300);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(153, 204, 153));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel LabelBienvenidos = new JLabel("REGISTRO DE VACUNACI\u00D3N LA SALLE");
		LabelBienvenidos.setBackground(new Color(255, 255, 255));
		LabelBienvenidos.setForeground(new Color(0, 0, 0));
		LabelBienvenidos.setFont(new Font("Georgia", Font.BOLD, 15));
		LabelBienvenidos.setBounds(56, 16, 335, 39);
		contentPane.add(LabelBienvenidos);
		
		JLabel LabelBienvenido = new JLabel("<< BIENVENIDO >>");
		LabelBienvenido.setFont(new Font("Georgia", Font.BOLD, 14));
		LabelBienvenido.setBounds(129, 74, 175, 13);
		contentPane.add(LabelBienvenido);
		
		JLabel LabelIngresaClave = new JLabel("Ingresa la clave ULSA");
		LabelIngresaClave.setForeground(new Color(0, 0, 51));
		LabelIngresaClave.setFont(new Font("Georgia", Font.PLAIN, 13));
		LabelIngresaClave.setBounds(137, 120, 146, 13);
		contentPane.add(LabelIngresaClave);
		
		passwordField = new JPasswordField();
		passwordField.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
                
				String c;
				c= passwordField.getText();
				clave= Integer.parseInt(c);
	
				
			}
		});
		passwordField.setBounds(147, 148, 114, 19);
		contentPane.add(passwordField);
		
		JButton ButtonIngresar = new JButton("Ingresar");
		ButtonIngresar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				Persona p = new Persona();
				
				Save s = new Save();
				p=s.Consultar(clave);
				if(p==null) {
					
					
					
					JOptionPane.showMessageDialog(null,"Registro no encontrado");
					Registro res = new Registro();
					
					res.setVisible(true);

				}else {
					
					Consultas con = new Consultas(p);
					con.setVisible(true);
				}
				
				
				dispose();
				
			}
		});
		ButtonIngresar.setBackground(new Color(224, 255, 255));
		ButtonIngresar.setFont(new Font("Times New Roman", Font.BOLD, 12));
		ButtonIngresar.setBounds(161, 203, 83, 21);
		contentPane.add(ButtonIngresar);
	}
	
	
	


	
}
