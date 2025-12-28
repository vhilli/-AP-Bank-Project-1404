import 'package:flutter/material.dart';
import '../../../data/models/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserModel _user;
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('خروج از حساب'),
        content: const Text(
          'آیا مطمئن هستید که می‌خواهید از حساب کاربری خارج شوید؟',
        ),
        actions: [
          TextButton(
            child: const Text('انصراف'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text(
              'خروج',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                    (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _user = UserModel.getMockUser();
  }

  void _showEditNameDialog() {
    final controller = TextEditingController(text: _user.name);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('ویرایش نام'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'نام جدید',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('لغو'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _user = UserModel(
                    name: controller.text,
                    username: _user.username,
                    email: _user.email,
                  );
                });
                Navigator.pop(context);
              },
              child: const Text('ذخیره'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('پروفایل'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              child: Icon(Icons.person, size: 40),
            ),
            const SizedBox(height: 16),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person_outline),
                    title: const Text('نام'),
                    subtitle: Text(_user.name),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: _showEditNameDialog,
                    ),
                  ),
                  const Divider(height: 0),
                  ListTile(
                    leading: const Icon(Icons.account_circle_outlined),
                    title: const Text('نام کاربری'),
                    subtitle: Text(_user.username),
                  ),
                  const Divider(height: 0),
                  ListTile(
                    leading: const Icon(Icons.email_outlined),
                    title: const Text('ایمیل'),
                    subtitle: Text(_user.email),
                  ),
                  const SizedBox(height: 32),
                  ListTile(
                    onTap: _showLogoutDialog,
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: const Text(
                      'خروج از حساب',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
