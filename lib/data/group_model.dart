import 'expense_model.dart';

class GroupModel {
  final String id;
  final String title;
  final List<String> members;
  final List<ExpenseModel> expenses;

  GroupModel({
    required this.id,
    required this.title,
    required this.members,
    required this.expenses,
  });

  static List<GroupModel> getMockGroups() {
    return [
      GroupModel(
        id: '1',
        title: 'سفر شمال',
        members: ['علی', 'سارا', 'رضا', 'فهیمه'],
        expenses: [
          ExpenseModel(
            title: 'هتل',
            paidBy: 'علی',
            amount: 4000000,
          ),
          ExpenseModel(
            title: 'غذا',
            paidBy: 'فهیمه',
            amount: 2500000,
          ),
        ],
      ),
    ];
  }
}
