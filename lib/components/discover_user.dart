import 'package:flutter/material.dart';
import 'package:flutter_insta/components/avatar.dart';

class DiscoverUser extends StatelessWidget {
  final String userID;
  final String description;
  const DiscoverUser(
      {required this.userID, required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: 150,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black12),
      ),
      child: Stack(
        children: [
          // Positioned - left: 0, top: 0,right: 0,bottom: 0, (전체공간 사용가능)
          Positioned(
            left: 15,
            top: 0,
            right: 15,
            bottom: 0,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Avatar(
                  thumbPath:
                      'https://thumbnews.nateimg.co.kr/view610///news.nateimg.co.kr/orgImg/hk/2019/08/02/03.20228245.1.jpg',
                  type: AvatarType.TYPE2,
                  size: 80,
                ),
                const SizedBox(height: 10),
                Text(
                  userID,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                  // 텍스트 정렬
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(onPressed: () {}, child: const Text('Follow'))
              ],
            ),
          ),
          Positioned(
            right: 5,
            top: 5,
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.close,
                size: 14,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
