import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum AvatarType { TYPE1, TYPE2, TYPE3 }

class Avatar extends StatelessWidget {
  bool? hasStroy;
  String thumbPath;
  String? nickname;
  AvatarType type;
  double? size;
  Avatar(
      {this.hasStroy,
      this.nickname,
      // 디폴트 값 정의
      this.size = 65,
      required this.thumbPath,
      required this.type,
      super.key});
  // 아바타 뒤에 그라데이션이 들어가야하는 위젯
  Widget type1Widget() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        // 아바타 테두리 보이게
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.purple, Colors.orange]),
          shape: BoxShape.circle,
        ),
        child: type2Widget());
  }

  // 내 프로필 아바타
  Widget type2Widget() {
    return Container(
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      // 아바타 테두리 흰색
      padding: const EdgeInsets.all(2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size!),
        child: SizedBox(
          width: size,
          height: size,
          child: CachedNetworkImage(
            imageUrl: thumbPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  // 중앙 스토리의 자신 프로필 사진
  Widget type3Widget() {
    return Row(
      children: [
        type1Widget(),
        Text(
          nickname ?? '',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AvatarType.TYPE1:
        return type1Widget();
      case AvatarType.TYPE2:
        return type2Widget();
      case AvatarType.TYPE3:
        return type3Widget();
    }
  }
}
