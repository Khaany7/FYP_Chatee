class UserModel {
  final String name;
  final String uid;
  final String profilepic;
  final bool isonline;
  final String phoneNumber;
  final List<String> groupId;
  UserModel({
    required this.name,
    required this.uid,
    required this.profilepic,
    required this.isonline,
    required this.phoneNumber,
    required this.groupId,
  });
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'profilepic': profilepic,
      'isonline': isonline,
      'phoneNumber': phoneNumber,
      'groupId': groupId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      uid: map['uid'] ?? '',
      profilepic: map['profilepic'] ?? '',
      isonline: map['isonline'] ?? false,
      phoneNumber: map['phoneNumber'] ?? '',
      groupId: List<String>.from(map['groupId']),
    );
  }
}
