import 'package:flutter/material.dart';
import '../../data/group_model.dart';
import 'shared_group_details_screen.dart';

class SharedGroupsScreen extends StatelessWidget {
  const SharedGroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<GroupModel> groups = GroupModel.getMockGroups();

    return Scaffold(
      appBar: AppBar(
        title: const Text('گروه‌های مشترک'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('ساخت گروه جدید (فعلاً نمایشی)'),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: groups.length,
        itemBuilder: (context, index) {
          return _GroupCard(group: groups[index]);
        },
      ),
    );
  }
}

class _GroupCard extends StatelessWidget {
  final GroupModel group;

  const _GroupCard({required this.group});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final int totalExpenses = group.expenses.fold(
      0,
          (sum, expense) => sum + expense.amount,
    );

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SharedGroupDetailsScreen(group: group),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                group.title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.people,
                        size: 20,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 6),
                      Text('${group.members.length} عضو'),
                    ],
                  ),
                  Text(
                    'مجموع: $totalExpenses تومان',
                    style: TextStyle(
                      color: theme.colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              Text(
                'اعضا',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: group.members
                    .map(
                      (member) => Chip(
                    label: Text(member),
                  ),
                )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
