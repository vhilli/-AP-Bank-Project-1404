import 'package:flutter/material.dart';
import '../../data/models/account_model.dart';

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({super.key});

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  final List<AccountModel> _allAccounts = AccountModel.getMockAccounts();

  String _searchQuery = '';
  AccountType? _selectedType; // null = همه

  List<AccountModel> get _filteredAccounts {
    return _allAccounts.where((account) {
      final matchesSearch =
          account.title.contains(_searchQuery) ||
              account.cardNumber.contains(_searchQuery);

      final matchesType =
          _selectedType == null || account.type == _selectedType;

      return matchesSearch && matchesType;
    }).toList();
  }

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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔍 Search
            TextField(
              decoration: const InputDecoration(
                hintText: 'جستجوی حساب...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),

            const SizedBox(height: 12),

            // 🧃 Filter
            Row(
              children: [
                ChoiceChip(
                  label: const Text('همه'),
                  selected: _selectedType == null,
                  onSelected: (_) {
                    setState(() {
                      _selectedType = null;
                    });
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('جاری'),
                  selected: _selectedType == AccountType.current,
                  onSelected: (_) {
                    setState(() {
                      _selectedType = AccountType.current;
                    });
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('پس‌انداز'),
                  selected: _selectedType == AccountType.savings,
                  onSelected: (_) {
                    setState(() {
                      _selectedType = AccountType.savings;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),

            // 📃 Accounts List
            Expanded(
              child: ListView.builder(
                itemCount: _filteredAccounts.length,
                itemBuilder: (context, index) {
                  final account = _filteredAccounts[index];
                  return _AccountCard(account: account);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountCard extends StatelessWidget {
  final AccountModel account;

  const _AccountCard({required this.account});

  @override
  Widget build(BuildContext context) {
    final typeText =
    account.type == AccountType.current ? 'جاری' : 'پس‌انداز';

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            '/account_details',
            arguments: account,
          );
        },
        child: ListTile(
          title: Text(account.title),
          subtitle: Text('$typeText • ${account.cardNumber}'),
          trailing: Text(
            '${account.balance} تومان',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
