import 'package:bank_app/data/transaction_model.dart';

enum AccountType {
  current,
  savings,
}

class AccountModel {
  final String id;
  final String title;
  final int balance;
  final AccountType type;
  final String accountNumber;
  final String cardNumber;
  final List<TransactionModel> transactions;

  AccountModel({
    required this.id,
    required this.title,
    required this.balance,
    required this.type,
    required this.accountNumber,
    required this.cardNumber,
    required this.transactions,
  });

  /// داده‌های نمایشی (Mock Data) برای فاز اول پروژه
  static List<AccountModel> getMockAccounts() {
    // تراکنش‌های حساب اصلی
    final mainAccountTransactions = [
      TransactionModel(
        id: 'T1001',
        title: 'واریز حقوق',
        amount: 12500000,
        date: DateTime.now().subtract(const Duration(days: 5)),
        type: TransactionType.deposit,
        category: 'درآمد',
      ),
      TransactionModel(
        id: 'T1002',
        title: 'خرید از فروشگاه',
        amount: 850000,
        date: DateTime.now().subtract(const Duration(days: 3)),
        type: TransactionType.withdrawal,
        category: 'خرید روزانه',
      ),
      TransactionModel(
        id: 'T1003',
        title: 'کارت به کارت',
        amount: 2000000,
        date: DateTime.now().subtract(const Duration(days: 1)),
        type: TransactionType.transfer,
      ),
    ];

    // تراکنش‌های حساب پس‌انداز
    final savingAccountTransactions = [
      TransactionModel(
        id: 'T2001',
        title: 'سود بانکی',
        amount: 150000,
        date: DateTime.now().subtract(const Duration(days: 10)),
        type: TransactionType.deposit,
        category: 'سرمایه‌گذاری',
      ),
      TransactionModel(
        id: 'T2002',
        title: 'برداشت نقدی',
        amount: 300000,
        date: DateTime.now().subtract(const Duration(days: 2)),
        type: TransactionType.withdrawal,
        category: 'متفرقه',
      ),
    ];

    return [
      AccountModel(
        id: 'ACC001',
        title: 'حساب اصلی',
        balance: 25400000,
        type: AccountType.current,
        accountNumber: '1234567890',
        cardNumber: '6037-xxxx-xxxx-1234',
        transactions: mainAccountTransactions,
      ),
      AccountModel(
        id: 'ACC002',
        title: 'حساب پس‌انداز',
        balance: 1500000,
        type: AccountType.savings,
        accountNumber: '0987654321',
        cardNumber: '6274-xxxx-xxxx-5678',
        transactions: savingAccountTransactions,
      ),
    ];
  }
}

