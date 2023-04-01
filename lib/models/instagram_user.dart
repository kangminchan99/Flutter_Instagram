class InstaUser {
  String? uid;
  String? nickname;
  String? thumbnail;
  String? description;

  InstaUser({
    this.description,
    this.nickname,
    this.thumbnail,
    this.uid,
  });

  factory InstaUser.fromJson(Map<String, dynamic> json) {
    return InstaUser(
      uid: json['uid'] == null ? '' : json['uid'] as String,
      nickname: json['nickname'] == null ? '' : json['nickname'] as String,
      description:
          json['description'] == null ? '' : json['description'] as String,
      thumbnail: json['thumnail'] == null ? '' : json['thumnail'] as String,
    );
  }
}
