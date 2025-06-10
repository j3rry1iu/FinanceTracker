// === SummaryAndDisplay.pde ===

void drawSummary() {
  float income = 0, expense = 0;
  for (Transaction t : transactions) {
    if (t.isIncome) income += t.amount;
    else expense += t.amount;
  }
  float balance = income - expense;
  fill(0);
  text("Income: $" + nf(income, 0, 2), 550, 40);
  text("Expense: $" + nf(expense, 0, 2), 550, 70);
  fill(balance >= 0 ? color(0, 150, 0) : color(200, 0, 0));
  text("Balance: $" + nf(balance, 0, 2), 550, 100);
}

void drawTransactions() {
  fill(0);
  text("Recent Transactions:", 40, 200);
  int y = 230;
  for (int i = max(0, transactions.size() - 10); i < transactions.size(); i++) {
    Transaction t = transactions.get(i);
    text(t.toString(), 60, y);
    y += 22;
  }
}

void drawPieChart() {
  float total = 0;
  HashMap<String, Float> categoryTotals = new HashMap<String, Float>();
  for (Transaction t : transactions) {
    if (!t.isIncome) {
      total += t.amount;
      if (!categoryTotals.containsKey(t.category)) categoryTotals.put(t.category, 0.0);
      categoryTotals.put(t.category, categoryTotals.get(t.category) + t.amount);
    }
  }
  if (total == 0) return;
  float angle = 0;
  int cx = 650, cy = 350, r = 100;
  colorMode(HSB);
  int index = 0;
  for (String cat : categoryTotals.keySet()) {
    float amt = categoryTotals.get(cat);
    float a = map(amt, 0, total, 0, TWO_PI);
    fill(map(index, 0, categoryTotals.size(), 0, 255), 200, 200);
    arc(cx, cy, r*2, r*2, angle, angle + a, PIE);
    angle += a;
    index++;
  }
  colorMode(RGB);
  fill(0);
  text("Expense Breakdown", 590, 480);
}
