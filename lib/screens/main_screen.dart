import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/balance_card.dart';
import 'income_list_screen.dart';
import 'expense_list_screen.dart';

class ExpenseMainScreen extends StatefulWidget {
  const ExpenseMainScreen({super.key});

  @override
  State<ExpenseMainScreen> createState() => _ExpenseMainScreenState();
}

class _ExpenseMainScreenState extends State<ExpenseMainScreen> {

  Future<void> _openScreen(Widget screen) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Контроль расходов'),
        centerTitle: true,
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.add_circle_outline),
          //   tooltip: 'Перейти к пополнениям',
          //   onPressed: () => _openScreen(const IncomeListScreen()),
          // ),
          // IconButton(
          //   icon: const Icon(Icons.remove_circle_outline),
          //   tooltip: 'Перейти к тратам',
          //   onPressed: () => _openScreen(const ExpenseListScreen()),
          // ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const BalanceCard(),
              ElevatedButton(
                onPressed: () => _openScreen(const IncomeListScreen()),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text('Пополнения'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _openScreen(const ExpenseListScreen()),
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
