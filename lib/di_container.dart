import 'package:get_it/get_it.dart';

import '../models/transaction.dart';

import 'package:flutter/material.dart';

final getIt = GetIt.instance;

void setupDI(TransactionStorage storage) {
  getIt.registerSingleton<List<Transaction>>(storage.incomes, instanceName: 'incomes');
  getIt.registerSingleton<List<Transaction>>(storage.expenses, instanceName: 'expenses');
  getIt.registerSingleton<ValueNotifier<double>>(storage.balance);
  getIt.registerSingleton(storage);
}

