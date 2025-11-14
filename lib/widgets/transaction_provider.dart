import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionProvider extends InheritedWidget {
  final List<Transaction> incomes;
  final List<Transaction> expenses;
  final ValueNotifier<double> balance;
  final void Function(Transaction) addTransaction;
  final void Function(Transaction) removeTransaction;

  TransactionProvider({
    super.key,
    required super.child,
    required this.incomes,
    required this.expenses,
    required this.balance,
    required this.addTransaction,
    required this.removeTransaction,
  });

  static TransactionProvider of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<TransactionProvider>();
    assert(result != null, 'No TransactionProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TransactionProvider oldWidget) =>
      incomes != oldWidget.incomes ||
          expenses != oldWidget.expenses ||
          balance != oldWidget.balance;
}
