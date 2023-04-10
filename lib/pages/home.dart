import 'package:flutter/material.dart';
import 'package:flutter_insta/components/avatar.dart';
import 'package:flutter_insta/components/image_data.dart';
import 'package:flutter_insta/components/post_widget.dart';
import 'package:flutter_insta/controller/home_controller.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  // 내 썸네일과  + 모양이 겹쳐있으므로 스택을 사용해야 한다.
  Widget _myStory() {
    return Stack(
      children: [
        Avatar(
            thumbPath:
                'https://img.hankyung.com/photo/202112/BF.28304936.1.jpg',
            size: 70,
            type: AvatarType.TYPE2),
        // 내 프로필 아래에 플러스 추가하기
        Positioned(
            right: 5,
            bottom: 0,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  border: Border.all(color: Colors.white, width: 2)),
              child: const Center(
                child: Text(
                  '+',
                  style:
                      TextStyle(color: Colors.white, fontSize: 20, height: 1.1),
                ),
              ),
            ))
      ],
    );
  }

  // 중앙 포스트 만들기
  Widget _postList() {
    return Obx(
      () => Column(
        children: List.generate(controller.postList.length,
            (index) => PostWidget(post: controller.postList[index])).toList(),
        // // List.generate - 리스트 개수 지정 및 인덱스 지정
        // List.generate(50, (index) => PostWidget()).toList(),
      ),
    );
  }

  // 아바타 영역 구현
  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        const SizedBox(width: 20),
        // ... - List 배열을 나열 하겠다는 의미
        _myStory(),
        const SizedBox(width: 5),
        ...List.generate(
          100,
          (index) => Avatar(
            type: AvatarType.TYPE1,
            thumbPath:
                'https://cdn.9oodnews.com/news/photo/202201/13232_19161_1443.jpg',
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ImageData(
          IconsPath.logo,
          width: 270,
        ),
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ImageData(
                IconsPath.directMessage,
                width: 50,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [_storyBoardList(), _postList()],
      ),
    );
  }
}
