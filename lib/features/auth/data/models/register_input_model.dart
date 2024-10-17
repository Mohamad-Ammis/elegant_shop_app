class RegisterInputModel {
  final String userName;
  final String email;
  final String password;

  RegisterInputModel(
      {required this.userName, required this.email, required this.password});
  toJson() {
    return {
      'email':email,
      'username':userName,
      'password':password
    };
  }
}
