import 'package:flutter/material.dart';
import 'package:bank_app/data/models/account_model.dart';
import 'package:bank_app/data/transaction_model.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final account = ModalRoute.of(context)!.settings.arguments as AccountModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(account.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _AccountHeader(account: account),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'تاریخچه تراکنش‌ها:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            _TransactionList(transactions: account.transactions),
          ],
        ),
      ),
    );
  }
}

class _AccountHeader extends StatelessWidget {
  final AccountModel account;

  const _AccountHeader({required this.account});

  @override
  Widget build(BuildContext context) {
    final accountTypeString = account.type == AccountType.current ? 'جاری' : 'پس‌انداز';
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            account.title,
            style: theme.textTheme.headlineSmall!.copyWith(color: Colors.white),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 10),
          Text(
            'موجودی فعلی:',
            style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white70),
            textAlign: TextAlign.right,
          ),
          Text(
            '${account.balance} تومان',
            style: theme.textTheme.headlineLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textDirection: TextDirection.ltr,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'نوع: $accountTypeString',
                style: theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
              ),
              Text(
                'شماره کارت: ${account.cardNumber}',
                style: theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TransactionList extends StatelessWidget {
  final List<TransactionModel> transactions;

  const _TransactionList({required this.transactions});

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return const Center(child: Text('تراکنشی ثبت نشده است.'));
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return _TransactionItem(transaction: transaction);
      },
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const _TransactionItem({required this.transaction});

  @override
  Widget build(BuildContext context) {
    final sign = transaction.type == TransactionType.deposit ? '+' : '-';
    final dateString = '${transaction.date.year}/${transaction.date.month}/${transaction.date.day}';

    return ListTile(
      leading: Icon(
        transaction.icon,
        color: transaction.color,
      ),
      title: Text(transaction.title, textAlign: TextAlign.right),
      subtitle: Text(dateString, textAlign: TextAlign.right),
      trailing: Text(
        '$sign ${transaction.amount} تومان',
        style: TextStyle(
          color: transaction.color,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }
}
