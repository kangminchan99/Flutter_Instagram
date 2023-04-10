import 'package:flutter_insta/models/instagram_user.dart';

class Post {
  final String? id;
  final String? thumbnail;
  final String? description;
  final int? likeCount;
  final InstaUser? userInfo;
  final String? uid;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  Post({
    this.createdAt,
    this.deletedAt,
    this.description,
    this.id,
    this.likeCount,
    this.thumbnail,
    this.uid,
    this.updatedAt,
    this.userInfo,
  });

  static Post? init(InstaUser userInfo) {
    var time = DateTime.now();
    return Post(
      thumbnail: '',
      userInfo: userInfo,
      uid: userInfo.uid,
      description: '',
      createdAt: time,
      updatedAt: time,
    );
  }

  factory Post.fromJson(String docId, Map<String, dynamic> json) {
    return Post(
      id: json['id'] == null ? '' : json['id'] as String,
      createdAt: json['createdAt'] == null
          ? DateTime.now()
          : json['createdAt'].toDate(),
      deletedAt: json['deletedAt'] == null
          ? DateTime.now()
          : json['deletedAt'].toDate(),
      updatedAt: json['updatedAt'] == null
          ? DateTime.now()
          : json['updatedAt'].toDate(),
      description:
          json['description'] == null ? '' : json['description'] as String,
      likeCount: json['likeCount'] == null ? 0 : json['likeCount'] as int,
      thumbnail: json['thumbnail'] == null ? '' : json['id'] as String,
      uid: json['uid'] == null ? '' : json['uid'] as String,
      userInfo: json['userInfo'] == null
          ? null
          : InstaUser.fromJson(json['userInfo']),
    );
  }

  Post copyWith({
    String? id,
    String? thumbnail,
    String? description,
    int? likeCount,
    InstaUser? userInfo,
    String? uid,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    return Post(
      id: id ?? this.id,
      thumbnail: thumbnail ?? this.thumbnail,
      description: description ?? this.description,
      likeCount: likeCount ?? this.likeCount,
      userInfo: userInfo ?? this.userInfo,
      uid: uid ?? this.uid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'thumbnail': thumbnail,
      'likeCount': likeCount,
      'userInfo': userInfo!.toMap(),
      'uid': uid,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
    };
  }
}
