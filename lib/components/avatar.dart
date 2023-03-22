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
      this.size,
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
      child: Container(
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        // 아바타 테두리 흰색
        padding: const EdgeInsets.all(2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(65),
          child: Container(
            width: 65,
            height: 65,
            child: CachedNetworkImage(
              imageUrl: thumbPath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AvatarType.TYPE1:
        return type1Widget();
        break;
      case AvatarType.TYPE2:
      case AvatarType.TYPE3:
        return Container();
        break;
    }
  }
}
