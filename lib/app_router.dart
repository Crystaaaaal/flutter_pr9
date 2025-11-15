import 'package:go_router/go_router.dart';
import 'screens/income_list_screen.dart';
import 'screens/expense_list_screen.dart';
import 'screens/transaction_form_screen.dart';
import 'screens/main_screen.dart';
import 'di/service_locator.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ExpenseMainScreen(balanceStore: getIt()),
    ),
    GoRoute(
      path: '/incomes',
      builder: (context, state) => IncomeListScreen(store: getIt()),
    ),
    GoRoute(
      path: '/expenses',
      builder: (context, state) => ExpenseListScreen(store: getIt()),
    ),
    GoRoute(
      path: '/add-income',
      builder: (context, state) => TransactionFormScreen(isIncome: true, store: getIt()),
    ),
    GoRoute(
      path: '/add-expense',
      builder: (context, state) => TransactionFormScreen(isIncome: false, store: getIt()),
    ),
  ],
);
