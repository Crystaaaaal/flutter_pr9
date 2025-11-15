import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../store/transaction_store.dart';
import '../widgets/balance_card.dart';

class ExpenseMainScreen extends StatelessWidget {
  final TransactionStore store;

  const ExpenseMainScreen({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Контроль расходов'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BalanceCard(store: store), // Показываем баланс через separate виджет
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.push('/incomes'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text('Пополнения'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.push('/expenses'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text('Траты'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
