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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('ساخت گروه جدید (فعلاً نمایشی)')),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: groups.length,
        itemBuilder: (context, index) {
          final group = groups[index];
          return _GroupCard(group: group);
        },
      ),
    );
  }
}

/// ویجت نمایش دهنده یک کارت گروه
class _GroupCard extends StatelessWidget {
  final GroupModel group;

  const _GroupCard({required this.group});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // محاسبه مجموع هزینه‌های گروه
    final totalExpenses = group.expenses.fold<int>(
      0,
      (sum, item) => sum + item.amount,
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                group.title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.people,
                          color: theme.colorScheme.primary, size: 20),
                      const SizedBox(width: 4),
                      Text('${group.members.length} عضو'),
                    ],
                  ),
                  Text(
                    'مجموع هزینه: $totalExpenses تومان',
                    style: TextStyle(
                      color: theme.colorScheme.secondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              Text('اعضا:', style: theme.textTheme.titleMedium),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: group.members
                    .map((member) => Chip(label: Text(member)))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
