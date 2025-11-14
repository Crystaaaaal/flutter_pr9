import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/transaction_provider.dart';

class ExpenseListScreen extends StatefulWidget {
  const ExpenseListScreen({super.key});
  @override
  State<ExpenseListScreen> createState() => _ExpenseListScreenState();
}

class _ExpenseListScreenState extends State<ExpenseListScreen> {
  void _deleteTransaction(BuildContext context, tx) {
    setState(() {
      TransactionProvider.of(context).removeTransaction(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = TransactionProvider.of(context);
    final expenses = provider.expenses;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Расходы'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Добавить расход',
            onPressed: () => context.push('/add-expense'),
          ),
          IconButton(
            icon: const Icon(Icons.swap_horiz),
            tooltip: 'Перейти к пополнениям',
            onPressed: () => context.push('/incomes'),
          ),
        ],
      ),
      body: expenses.isEmpty
          ? const Center(child: Text('Пока нет расходов'))
          : ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, i) {
          final tx = expenses[i];
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
                    '-${tx.amount.toStringAsFixed(2)} ₽',
                    style: const TextStyle(color: Colors.red),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.grey),
                    onPressed: () => _deleteTransaction(context, tx),
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
