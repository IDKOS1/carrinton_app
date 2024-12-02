class UserInfo {
  final String name;
  final String position;

  UserInfo._({
    this.name = "Unknown",
    this.position = "null"
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo._(
      name: json['total'] as String,
      position: json['position'] as String
    );
  }
}
