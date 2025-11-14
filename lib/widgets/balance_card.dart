import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final balance = GetIt.instance<ValueNotifier<double>>();
    return ValueListenableBuilder<double>(
      valueListenable: balance,
      builder: (context, value, _) {
        return Card(
          elevation: 3,
          color: Colors.teal.shade50,
          margin: const EdgeInsets.only(bottom: 30),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  'Текущий баланс:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Text(
                  '${value.toStringAsFixed(2)} ₽',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: value >= 0 ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
