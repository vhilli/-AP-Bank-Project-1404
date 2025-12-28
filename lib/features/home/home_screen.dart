import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('داشبورد'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'پروفایل',
            icon: const Icon(Icons.person_outline),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'سلام 👋',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.primaryColor,
                    theme.primaryColor.withOpacity(0.85),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: theme.primaryColor.withOpacity(0.3),
                    blurRadius: 14,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'موجودی کل',
                        style: TextStyle(color: Colors.white70),
                      ),
                      Icon(Icons.visibility, color: Colors.white70),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    '25,400,000 تومان',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'دسترسی سریع',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                _QuickAction(
                  icon: Icons.swap_horiz,
                  title: 'انتقال وجه',
                  onTap: () {
                    Navigator.pushNamed(context, '/transfer');
                  },
                ),
                _QuickAction(
                  icon: Icons.account_balance,
                  title: 'حساب‌ها',
                  onTap: () {
                    Navigator.pushNamed(context, '/accounts');
                  },
                ),
                _QuickAction(
                  icon: Icons.group,
                  title: 'گروه‌ها',
                  onTap: () {
                    Navigator.pushNamed(context, '/groups');
                  },
                ),
                _QuickAction(
                  icon: Icons.person,
                  title: 'پروفایل',
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const _QuickAction({
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: SizedBox(
        width: 72,
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
