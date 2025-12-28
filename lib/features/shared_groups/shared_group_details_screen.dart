import 'package:flutter/material.dart';
import 'package:bank_app/data/group_model.dart';

class SharedGroupDetailsScreen extends StatelessWidget {
  final GroupModel group;

  const SharedGroupDetailsScreen({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(group.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'اعضای گروه',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: group.members
                  .map((e) => Chip(label: Text(e)))
                  .toList(),
            ),
            const SizedBox(height: 24),
            const Text(
              'هزینه‌ها',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: group.expenses.length,
                itemBuilder: (context, index) {
                  final expense = group.expenses[index];
                  return Card(
                    child: ListTile(
                      title: Text(expense.title),
                      subtitle: Text('پرداخت شده توسط ${expense.paidBy}'),
                      trailing: Text('${expense.amount} تومان'),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('افزودن هزینه'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('نتیجه نهایی'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
