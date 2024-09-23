import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Font;
import java.awt.Color;
import java.awt.Window.Type;
import javax.swing.JLabel;

public class Main extends JFrame {

	private JPanel contentPane;
	private Principal frameP = new Principal();
	private Registro frameR = new Registro();
	
	
	//Tafoya Lozano Lizeth Guadalupe
	//Tapia Valeria
	//Pedroza Díaz Leonardo

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Main frame = new Main();
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
	public Main() {
		setType(Type.POPUP);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 300);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(0, 102, 153));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JButton ButtonIniciar = new JButton("Iniciar Sesi\u00F3n");
		ButtonIniciar.setBackground(new Color(204, 255, 255));
		ButtonIniciar.setFont(new Font("Georgia", Font.PLAIN, 18));
		ButtonIniciar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				
				frameP.setVisible(true);
				frameR.setVisible(false);
				
			}
		});
		ButtonIniciar.setBounds(145, 119, 156, 21);
		contentPane.add(ButtonIniciar);
		
		JButton ButtonRegistro = new JButton("Registrarse");
		ButtonRegistro.setBackground(new Color(204, 255, 255));
		ButtonRegistro.setFont(new Font("Georgia", Font.PLAIN, 18));
		ButtonRegistro.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				
				frameP.setVisible(false);
				frameR.setVisible(true);
				
			}
		});
		ButtonRegistro.setBounds(145, 169, 156, 21);
		contentPane.add(ButtonRegistro);
		
		JLabel LabelBienvenidos = new JLabel("REGISTRO DE VACUNACI\u00D3N LA SALLE");
		LabelBienvenidos.setForeground(new Color(255, 255, 255));
		LabelBienvenidos.setFont(new Font("Georgia", Font.BOLD, 17));
		LabelBienvenidos.setBackground(new Color(255, 255, 255));
		LabelBienvenidos.setBounds(42, 47, 367, 39);
		contentPane.add(LabelBienvenidos);
	}
}
