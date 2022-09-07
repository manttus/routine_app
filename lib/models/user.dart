class User {
  final String? id;
  final String? email;
  final String? photoUrl;

  User({this.email, this.id, this.photoUrl});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'],
        email: json['email'],
        photoUrl: json['photoUrl'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'photoUrl': photoUrl,
      };
}
