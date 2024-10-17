class SigninInputModel {
 final String userName;
  final String password;

  SigninInputModel(
      {required this.userName,  required this.password});
  toJson() {
    return {
      'user':userName,
      'password':password
    };
  }
}