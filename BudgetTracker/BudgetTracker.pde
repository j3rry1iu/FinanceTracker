// === BudgetTracker.pde ===

ArrayList<Transaction> transactions;
String categoryInput = "";
String amountInput = "";
boolean isIncome = true;
boolean typingCategory = true;

void setup() {
  size(800, 600);
  textFont(createFont("Arial", 16));
  transactions = new ArrayList<Transaction>();
  loadTransactions();
}

void draw() {
  background(250);
  drawUI();
}

void drawUI() {
  drawInputFields();
  drawButtons();
  drawSummary();
  drawTransactions();
  drawPieChart();
}

void drawInputFields() {
  fill(0);
  text("Category:", 40, 40);
  rect(150, 20, 200, 30);
  fill(typingCategory ? color(0) : color(100));
  text(categoryInput, 160, 40);

  fill(0);
  text("Amount ($):", 40, 90);
  rect(150, 70, 200, 30);
  fill(typingCategory ? color(100) : color(0));
  text(amountInput, 160, 90);
}

void drawButtons() {
  drawButton(40, 130, 150, 35, isIncome ? "Type: Income" : "Type: Expense");
  drawButton(200, 130, 80, 35, "Add");
  drawButton(300, 130, 80, 35, "Save");
  drawButton(400, 130, 120, 35, "Sort by Amount");
}

void drawButton(int x, int y, int w, int h, String label) {
  fill(220);
  rect(x, y, w, h, 8);
  fill(0);
  text(label, x + 10, y + 22);
}

void mousePressed() {
  if (overRect(40, 130, 150, 35)) isIncome = !isIncome;
  else if (overRect(200, 130, 80, 35)) addTransaction();
  else if (overRect(300, 130, 80, 35)) saveTransactions();
  else if (overRect(400, 130, 120, 35)) sortTransactionsByAmount();
  else if (mouseY > 20 && mouseY < 50 && mouseX > 150 && mouseX < 350) typingCategory = true;
  else if (mouseY > 70 && mouseY < 100 && mouseX > 150 && mouseX < 350) typingCategory = false;
}

boolean overRect(int x, int y, int w, int h) {
  return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
}

void keyPressed() {
  if (key == BACKSPACE) {
    if (typingCategory && categoryInput.length() > 0) categoryInput = categoryInput.substring(0, categoryInput.length() - 1);
    else if (!typingCategory && amountInput.length() > 0) amountInput = amountInput.substring(0, amountInput.length() - 1);
  } else if (key == ENTER || key == RETURN) addTransaction();
  else if (key == TAB) typingCategory = !typingCategory;
  else if (key >= 32 && key <= 126) {
    if (typingCategory) categoryInput += key;
    else amountInput += key;
  }
}

void addTransaction() {
  try {
    float amt = float(amountInput);
    transactions.add(new Transaction(categoryInput, amt, isIncome));
    categoryInput = "";
    amountInput = "";
  } catch (Exception e) {
    println("Invalid amount.");
  }
}
