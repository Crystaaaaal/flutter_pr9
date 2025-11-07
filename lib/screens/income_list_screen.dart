import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'expense_list_screen.dart';
import 'transaction_form_screen.dart';

class IncomeListScreen extends StatefulWidget {
  const IncomeListScreen({super.key});

  @override
  State<IncomeListScreen> createState() => _IncomeListScreenState();
}

class _IncomeListScreenState extends State<IncomeListScreen> {
  void _openForm() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const TransactionFormScreen(isIncome: true)),
    );
    setState(() {});
  }

  void _switchToExpenses() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const ExpenseListScreen()),
    );
  }

  void _deleteTransaction(Transaction tx) {
    setState(() {
      TransactionStorage.removeTransaction(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    final incomes = TransactionStorage.incomes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Пополнения'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: _openForm,
            tooltip: 'Добавить пополнение',
          ),
          IconButton(
            icon: const Icon(Icons.swap_horiz),
            onPressed: _switchToExpenses,
            tooltip: 'Перейти к расходам',
          ),
        ],
      ),
      body: incomes.isEmpty
          ? const Center(child: Text('Пока нет пополнений'))
          : ListView.builder(
        itemCount: incomes.length,
        itemBuilder: (context, index) {
          final tx = incomes[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(tx.imageUrl)),
              title: Text(tx.title),
              subtitle: Text(tx.source),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '+${tx.amount.toStringAsFixed(2)} ₽',
                    style: const TextStyle(color: Colors.green),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () => _deleteTransaction(tx),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
