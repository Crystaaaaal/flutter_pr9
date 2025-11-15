import 'package:mobx/mobx.dart';

part 'transaction_store.g.dart';


class Transaction {
  final double amount;
  final String title;
  final String source;
  final bool isIncome;
  final String imageUrl;

  Transaction({
    required this.amount,
    required this.title,
    required this.source,
    required this.isIncome,
    required this.imageUrl,
  });
}

class TransactionStore = _TransactionStore with _$TransactionStore;

abstract class _TransactionStore with Store {
  @observable
  ObservableList<Transaction> incomes = ObservableList<Transaction>();

  @observable
  ObservableList<Transaction> expenses = ObservableList<Transaction>();

  @computed
  double get balance =>
      incomes.fold(0.0, (sum, tx) => sum + tx.amount)
          - expenses.fold(0.0, (sum, tx) => sum + tx.amount);

  @action
  void addTransaction(Transaction tx) {
    if (tx.isIncome) {
      incomes.add(tx);
    } else {
      expenses.add(tx);
    }
  }

  @action
  void removeTransaction(Transaction tx) {
    if (tx.isIncome) {
      incomes.remove(tx);
    } else {
      expenses.remove(tx);
    }
  }

  void setStartData(List<Transaction> incomesInit, List<Transaction> expensesInit) {
    incomes.clear();
    incomes.addAll(incomesInit);
    expenses.clear();
    expenses.addAll(expensesInit);
  }
}
