class RegisterInputModel {
  final String userName;
  final String email;
  final String password;
  final String? image;

  RegisterInputModel(
      {required this.userName, required this.email, required this.password,required this.image,});
  toJson() {
    return {
      'email':email,
      'username':userName,
      'password':password
    };
  }
}
