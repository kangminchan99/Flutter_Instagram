import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta/components/avatar.dart';
import 'package:flutter_insta/components/image_data.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Avatar(
              thumbPath:
                  'https://thumbnews.nateimg.co.kr/view610///news.nateimg.co.kr/orgImg/hk/2019/08/02/03.20228245.1.jpg',
              nickname: '황예지',
              size: 40,
              type: AvatarType.TYPE3),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(IconsPath.postMoreIcon),
            ),
          )
        ],
      ),
    );
  }

  Widget _image() {
    return CachedNetworkImage(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOzHuGO2wHJEggIcRVKIS_0SzoJ2zkJzQQEw&usqp=CAU');
  }

  Widget _like() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageData(IconsPath.likeOffIcon, width: 65),
              const SizedBox(width: 15),
              ImageData(IconsPath.replyIcon, width: 60),
              const SizedBox(width: 15),
              ImageData(IconsPath.directMessage, width: 55),
            ],
          ),
          ImageData(IconsPath.bookMarkOffIcon, width: 50)
        ],
      ),
    );
  }

  Widget _infoDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'like 50개',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // 텍스트 접고 펼치기
          ExpandableText(
            '1\n2\n3\n4\n',
            prefixText: '황예지',
            onPrefixTap: () {
              print('황예지 프로필로 이동');
            },
            prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
            expandText: '더보기',
            collapseText: '접기',
            // 3번째부터 더보기 기능 활성화
            maxLines: 3,
            linkColor: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget _replyText() {
    return GestureDetector(
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            '댓글 200개 모두 보기',
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ));
  }

  Widget _postTime() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        '1일전',
        style: TextStyle(fontSize: 11, color: Colors.grey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        // CrossAxisAlignment.stretch - 컬럼일 때 맨 앞으로 이동
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(),
          const SizedBox(height: 15),
          _image(),
          const SizedBox(height: 15),
          // 좋아요 개수
          _like(),
          const SizedBox(height: 5),
          _infoDescription(),
          const SizedBox(height: 5),
          // 댓글
          _replyText(),
          const SizedBox(height: 5),
          // 포스터 올린 시간
          _postTime()
        ],
      ),
    );
  }
}
