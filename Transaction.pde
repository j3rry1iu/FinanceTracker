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


}
