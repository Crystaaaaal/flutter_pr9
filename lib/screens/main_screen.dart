import 'package:flutter/material.dart';

class ExpenseMainScreen extends StatelessWidget {
  const ExpenseMainScreen({super.key});

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
              ElevatedButton(
                onPressed: () {
                  // Здесь будет логика для пополнений
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text('Пополнения'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Здесь будет логика для трат
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text('Расходы'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Здесь будет логика для расходов
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text('Статистика'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
