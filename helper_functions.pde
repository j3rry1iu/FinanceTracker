void updateBalance() {
  label2.setText(String.format("Current Balance: $%.2f", balance));
  if (balance < 0) {
    label2.setLocalColorScheme(G4P.RED_SCHEME);
  } else {
    label2.setLocalColorScheme(G4P.GREEN_SCHEME);
  }
}

void addTransaction(boolean isIncome) {
  try {
    String amount = textfield3.getText(); 
    amountF = float(amount); 
    if (amountF <= 0) {
      G4P.showMessage(this, "Amount must be positive", "Error",JOptionPane.WARNING_MESSAGE);
      return;
    }
    
    if (!isIncome) {
      amountF = -amountF;
    }
    
    String category = dropList1.getSelectedText();
    Transaction t = new Transaction(category,amountF, isIncome);
    transactions.add(t);
    balance += amountF;
    
    updateBalance();
    //updateTransactionList(); 
    textfield3.setText("");
  } catch (NumberFormatException e) {
    G4P.showMessage(this, "Please enter a valid amount", "Error", JOptionPane.WARNING_MESSAGE);
  }
}
