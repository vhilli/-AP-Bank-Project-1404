class UserModel {
  final String name;
  final String username;
  final String email;

  UserModel({
    required this.name,
    required this.username,
    required this.email,
  });

  static UserModel getMockUser() {
    return UserModel(
      name: ' فهیمه ولایتی ',
      username: 'fa_vlt',
      email: 'fahimevlt@gmail.com',
    );
  }
}
