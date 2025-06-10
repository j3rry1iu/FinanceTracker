// === Transaction.pde ===

class Transaction {
  String category;
  float amount;
  boolean isIncome;

  Transaction(String c, float a, boolean i) {
    category = c;
    amount = a;
    isIncome = i;
  }

  String toString() {
    return category + ": " + (isIncome ? "+$" : "-$") + nf(amount, 0, 2);
  }

  String toFileString() {
    return category + "," + amount + "," + isIncome;
  }

  static Transaction fromFileString(String line) {
    String[] parts = split(line, ",");
    if (parts.length != 3) return null;
    return new Transaction(parts[0], float(parts[1]), Boolean.parseBoolean(parts[2]));
  }
}
