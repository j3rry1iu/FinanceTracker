// === SaveAndSort.pde ===

void saveTransactions() {
  String[] lines = new String[transactions.size()];
  for (int i = 0; i < transactions.size(); i++) {
    lines[i] = transactions.get(i).toFileString();
  }
  saveStrings("transactions.txt", lines);
  println("Saved " + lines.length + " transactions.");
}

void loadTransactions() {
  try {
    String[] lines = loadStrings("transactions.txt");
    for (String line : lines) {
      Transaction t = Transaction.fromFileString(line);
      if (t != null) transactions.add(t);
    }
  } catch (Exception e) {
    println("No transactions file found.");
  }
}

void sortTransactionsByAmount() {
  mergeSort(transactions);
}

void mergeSort(ArrayList<Transaction> list) {
  if (list.size() <= 1) return;
  int mid = list.size() / 2;
  ArrayList<Transaction> left = new ArrayList<Transaction>(list.subList(0, mid));
  ArrayList<Transaction> right = new ArrayList<Transaction>(list.subList(mid, list.size()));
  mergeSort(left);
  mergeSort(right);
  merge(list, left, right);
}

void merge(ArrayList<Transaction> list, ArrayList<Transaction> left, ArrayList<Transaction> right) {
  int i = 0, j = 0, k = 0;
  while (i < left.size() && j < right.size()) {
    if (left.get(i).amount < right.get(j).amount) {
      list.set(k++, left.get(i++));
    } else {
      list.set(k++, right.get(j++));
    }
  }
  while (i < left.size()) list.set(k++, left.get(i++));
  while (j < right.size()) list.set(k++, right.get(j++));
}
