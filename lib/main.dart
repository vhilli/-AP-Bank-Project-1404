import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'presentation/screens/transfer_money_screen.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/login_screen.dart';
import 'features/home/home_screen.dart';
import 'features/accounts/accounts_screen.dart';
import 'features/accounts/account_details_screen.dart';
import 'features/shared_groups/shared_groups_screen.dart';
import 'presentation/screens/profile/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa'),
      supportedLocales: const [
        Locale('fa'),
        Locale('en'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/accounts': (context) => AccountsScreen(),
        '/account_details': (context) => const AccountDetailsScreen(),
        '/groups': (context) => const SharedGroupsScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/transfer': (context) => const TransferMoneyScreen(),
      },
    );
  }
}
