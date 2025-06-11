import g4p_controls.*; 
import javax.swing.JOptionPane;
ArrayList<Transaction> transactions;
float balance = 0;
boolean isIncome; 
float amountF;

void setup() {
  size(800, 800);
  createGUI();
  textFont(createFont("Arial", 16));
  transactions = new ArrayList<Transaction>();
}

void draw() {
  background(250);
}
