import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // ✅ جلوگیری از ساخته شدن object

  // 🎨 رنگ‌های اصلی
  static const Color primary = Color(0xFF1565C0); // آبی بانکی
  static const Color secondary = Color(0xFF0D47A1);

  // 🧾 پس‌زمینه
  static const Color background = Color(0xFFF5F7FA);
  static const Color surface = Colors.white;

  // ✏️ متن‌ها
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF616161);

  // ✅ وضعیت‌ها
  static const Color success = Color(0xFF2E7D32);
  static const Color error = Color(0xFFC62828);
  static const Color warning = Color(0xFFF9A825);
}
