import 'package:flutter/material.dart';
import '../../data/models/account_model.dart';

class AccountsScreen extends StatelessWidget {
  AccountsScreen({super.key});

  final List<AccountModel> accounts = [
    AccountModel(
      title: 'حساب اصلی',
      number: '**** 1234',
      type: 'جاری',
      balance: 15400000,
    ),
    AccountModel(
      title: 'حساب پس‌انداز',
      number: '**** 9876',
      type: 'پس‌انداز',
      balance: 10000000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حساب‌های من'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // فاز ۱ → فقط نمایشی
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          final account = accounts[index];
          return _AccountCard(account: account);
        },
      ),
    );
  }
}

class _AccountCard extends StatelessWidget {
  final AccountModel account;

  const _AccountCard({required this.account});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(account.title),
        subtitle: Text('${account.type} • ${account.number}'),
        trailing: Text(
          '${account.balance.toString()} تومان',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
