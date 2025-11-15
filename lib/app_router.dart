import 'package:go_router/go_router.dart';
import 'screens/income_list_screen.dart';
import 'screens/expense_list_screen.dart';
import 'screens/transaction_form_screen.dart';
import 'screens/main_screen.dart';
import 'main.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ExpenseMainScreen(store: transactionStore),
    ),
    GoRoute(
      path: '/incomes',
      builder: (context, state) => IncomeListScreen(store: transactionStore),
    ),
    GoRoute(
      path: '/expenses',
      builder: (context, state) => ExpenseListScreen(store: transactionStore),
    ),
    GoRoute(
      path: '/add-income',
      builder: (context, state) => TransactionFormScreen(isIncome: true, store: transactionStore),
    ),
    GoRoute(
      path: '/add-expense',
      builder: (context, state) => TransactionFormScreen(isIncome: false, store: transactionStore),
    ),
  ],
);
