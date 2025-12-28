import 'package:flutter/material.dart';

class TransferMoneyScreen extends StatefulWidget {
  const TransferMoneyScreen({super.key});

  @override
  State<TransferMoneyScreen> createState() => _TransferMoneyScreenState();
}

class _TransferMoneyScreenState extends State<TransferMoneyScreen> {
  final _formKey = GlobalKey<FormState>();

  final _fromAccountController = TextEditingController();
  final _toCardController = TextEditingController();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _fromAccountController.dispose();
    _toCardController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('✅ انتقال وجه با موفقیت انجام شد (شبیه‌سازی شده)'),
        ),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('انتقال وجه'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildField(
                controller: _fromAccountController,
                label: 'شماره حساب مبدأ',
                icon: Icons.account_balance,
              ),
              _buildField(
                controller: _toCardController,
                label: 'شماره کارت مقصد',
                icon: Icons.credit_card,
                keyboardType: TextInputType.number,
              ),
              _buildField(
                controller: _amountController,
                label: 'مبلغ (تومان)',
                icon: Icons.payments,
                keyboardType: TextInputType.number,
              ),
              _buildField(
                controller: _descriptionController,
                label: 'توضیحات (اختیاری)',
                icon: Icons.description,
                required: false,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'انتقال وجه',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool required = true,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: required
            ? (value) =>
        value == null || value.isEmpty ? 'این فیلد الزامی است' : null
            : null,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
