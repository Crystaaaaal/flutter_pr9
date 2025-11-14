import 'package:flutter/material.dart';

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

class TransactionStorage {
  final List<Transaction> incomes = [];
  final List<Transaction> expenses = [];
  final ValueNotifier<double> balance = ValueNotifier(0.0);

  void addTransaction(Transaction tx) {
    if (tx.isIncome) {
      incomes.add(tx);
      balance.value += tx.amount;
    } else {
      expenses.add(tx);
      balance.value -= tx.amount;
    }
  }

  void removeTransaction(Transaction tx) {
    if (tx.isIncome) {
      incomes.remove(tx);
      balance.value -= tx.amount;
    } else {
      expenses.remove(tx);
      balance.value += tx.amount;
    }
  }

  void recalculateBalance() {
    final totalIncome = incomes.fold<double>(0.0, (sum, tx) => sum + tx.amount);
    final totalExpenses = expenses.fold<double>(0.0, (sum, tx) => sum + tx.amount);
    balance.value = totalIncome - totalExpenses;
  }
}
