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

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nickname': nickname,
      'thumnail': thumbnail,
      'description': description,
    };
  }

  InstaUser copyWith({
    String? uid,
    String? nickname,
    String? thumbnail,
    String? description,
  }) {
    return InstaUser(
      // 넘어온 데이터가 널값인 경우 기존의 데이터를 사용
      uid: uid ?? this.uid,
      nickname: nickname ?? this.nickname,
      thumbnail: thumbnail ?? this.thumbnail,
      description: description ?? this.description,
    );
  }
}
