import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'app_router.dart';
import 'store/transaction_store.dart';

final transactionStore = TransactionStore();

// Начальные данные
final initialExpenses = [
  Transaction(
    amount: 1200,
    title: 'Продукты',
    source: 'Покупка еды в супермаркете',
    isIncome: false,
    imageUrl: 'https://images.thevoicemag.ru/upload/img_cache/493/493173ba9d947eb9624440f06237437e_cropped_666x444.jpg',
  ),
  Transaction(
    amount: 350,
    title: 'Транспорт',
    source: 'Проезд на автобусе',
    isIncome: false,
    imageUrl: 'https://www.shutterstock.com/image-vector/transport-travel-car-train-bus-600w-506212144.jpg',
  ),
];

final initialIncomes = [
  Transaction(
    amount: 50000,
    title: 'Зарплата',
    source: 'Основная работа',
    isIncome: true,
    imageUrl: 'https://img.gazeta.ru/files3/705/16249705/vkonvertr-pic_32ratio_1200x800-1200x800-79503.jpg',
  ),
  Transaction(
    amount: 7000,
    title: 'Фриланс',
    source: 'Проект по дизайну',
    isIncome: true,
    imageUrl: 'https://cdn-icons-png.flaticon.com/512/1807/1807705.png',
  ),
];

void main() {
  transactionStore.setStartData(initialIncomes, initialExpenses);
  runApp(const ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Контроль расходов',
      routerConfig: appRouter,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
    );
  }
}
