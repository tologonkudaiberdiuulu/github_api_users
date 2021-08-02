class User {
  final int id;
  final String? name;
  final String login;
  final String avatar;
  final String? email;
  final String? organization;
  final int? followers;
  final int? following;
  final String? createdAt;

  User({
    required this.id,
    required this.login,
    required this.avatar,
    this.name,
    this.email,
    this.followers,
    this.following,
    this.createdAt,
    this.organization,
  });

  Map toJson() => {
        'id': id,
        'name': name,
        'login': login,
        'avatar_url': avatar,
        'email': email,
        'followers': followers,
        'following': following,
        'created_at': createdAt,
        'organization': organization,
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        login: json['login'],
        avatar: json['avatar_url'],
        createdAt: json['created_at'],
        email: json['email'],
        followers: json['followers'],
        following: json['following'],
      );

  static User get emptyUser {
    return User(
      id: 0,
      login: '',
      avatar: '',
    );
  }

  String get userName {
    return name ?? 'No Name';
  }

  String get createdData {
    return createdAt ?? 'Empty';
  }

  String get userEmail {
    return email ?? 'No email';
  }

  int get userFollowers {
    return followers ?? 0;
  }

  int get userFollowings {
    return following ?? 0;
  }
}
