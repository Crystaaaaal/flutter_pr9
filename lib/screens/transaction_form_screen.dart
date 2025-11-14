import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../di_container.dart';
import '../models/transaction.dart';

class TransactionFormScreen extends StatefulWidget {
  final bool isIncome;
  const TransactionFormScreen({super.key, required this.isIncome});

  @override
  State<TransactionFormScreen> createState() => _TransactionFormScreenState();
}

class _TransactionFormScreenState extends State<TransactionFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _sourceController = TextEditingController();
  final _amountController = TextEditingController();
  final _imageUrlController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final tx = Transaction(
        title: _titleController.text,
        source: _sourceController.text,
        amount: double.tryParse(_amountController.text) ?? 0.0,
        isIncome: widget.isIncome,
        imageUrl: _imageUrlController.text.isNotEmpty
            ? _imageUrlController.text
            : 'https://via.placeholder.com/100',
      );
      getIt<TransactionStorage>().addTransaction(tx);
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.isIncome ? 'Добавить пополнение' : 'Добавить расход';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Название'),
                validator: (v) => v == null || v.isEmpty ? 'Введите название' : null,
              ),
              TextFormField(
                controller: _sourceController,
                decoration: const InputDecoration(labelText: 'Источник'),
              ),
              TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(labelText: 'Сумма'),
                keyboardType: TextInputType.number,
                validator: (v) => v == null || v.isEmpty ? 'Введите сумму' : null,
              ),
              TextFormField(
                controller: _imageUrlController,
                decoration: const InputDecoration(labelText: 'URL картинки'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text(title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
