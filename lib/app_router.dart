import 'package:go_router/go_router.dart';
import 'screens/main_screen.dart';
import 'screens/income_list_screen.dart';
import 'screens/expense_list_screen.dart';
import 'screens/transaction_form_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'main',
      builder: (context, state) => const ExpenseMainScreen(),
    ),
    GoRoute(
      path: '/incomes',
      builder: (context, state) => IncomeListScreen(),
    ),
    GoRoute(
      path: '/expenses',
      builder: (context, state) => ExpenseListScreen(),
    ),
    GoRoute(
      path: '/add-income',
      builder: (context, state) => const TransactionFormScreen(isIncome: true),
    ),
    GoRoute(
      path: '/add-expense',
      builder: (context, state) => const TransactionFormScreen(isIncome: false),
    ),
  ],
);