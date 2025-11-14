import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/balance_card.dart';

class ExpenseMainScreen extends StatefulWidget {
  const ExpenseMainScreen({super.key});

  @override
  State<ExpenseMainScreen> createState() => _ExpenseMainScreenState();
}

class _ExpenseMainScreenState extends State<ExpenseMainScreen> {
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
              const BalanceCard(),
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