class User {
  String? username;
  String? avatar;

  User({this.username, this.avatar});

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json['username'] as String?,
        avatar: json['avatar'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'avatar': avatar,
      };
}
