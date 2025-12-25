import 'package:flutter/material.dart';
import '../../data/models/account_model.dart';

class AccountsScreen extends StatelessWidget {
  AccountsScreen({super.key});

  // ✅ استفاده از داده‌های نمایشی استاندارد از مدل
  final List<AccountModel> accounts = AccountModel.getMockAccounts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حساب‌های من'),
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
    final accountTypeString = account.type == AccountType.current ? 'جاری' : 'پس‌انداز';

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell( // 👈 InkWell برای اضافه کردن قابلیت کلیک و افکت موج (Ripple Effect)
        onTap: () {
          // ناوبری به صفحه جزئیات حساب و ارسال شیء AccountModel
          Navigator.of(context).pushNamed(
            '/account_details', // این Route را در مرحله ۳ اضافه می‌کنیم
            arguments: account, // ارسال مدل حساب به صفحه جدید
          );
        },
        child: ListTile(
          // ... (کدهای قبلی ListTile)
          title: Text(account.title),
          subtitle: Text('$accountTypeString • ${account.cardNumber}'),
          trailing: Text(
            '${account.balance} تومان',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
