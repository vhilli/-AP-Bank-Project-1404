class UserModel {
  final String name;
  final String username;
  final String email;

  UserModel({
    required this.name,
    required this.username,
    required this.email,
  });

  /// Mock data for Phase 1 (no backend)
  static UserModel getMockUser() {
    return UserModel(
      name: 'شایان احمدی',
      username: 'shayan_ahmadi',
      email: 'shayan@gmail.com',
    );
  }
}
