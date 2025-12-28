import 'package:flutter/material.dart';

enum TransactionType { deposit, withdrawal, transfer }

class TransactionModel {
  final String id;
  final String title;
  final int amount;
  final DateTime date;
  final TransactionType type;
  final String category;

  TransactionModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.type,
    this.category = 'بدون دسته‌بندی',
  });

  Color get color {
    switch (type) {
      case TransactionType.deposit:
        return Colors.green.shade700;
      case TransactionType.withdrawal:
        return Colors.red.shade700;
      case TransactionType.transfer:
        return Colors.orange.shade700;
      default:
        return Colors.grey.shade700;
    }
  }

  IconData get icon {
    switch (type) {
      case TransactionType.deposit:
        return Icons.arrow_upward;
      case TransactionType.withdrawal:
        return Icons.shopping_basket;
      case TransactionType.transfer:
        return Icons.swap_horiz;
      default:
        return Icons.info_outline;
    }
  }
}
