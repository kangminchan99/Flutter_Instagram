import 'package:flutter/material.dart';
import 'package:flutter_insta/components/image_data.dart';
import 'package:flutter_insta/controller/upload_controller.dart';
import 'package:get/get.dart';

class UploadDescription extends GetView<UploadController> {
  const UploadDescription({super.key});

  Widget _description() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Image.file(
              controller.filteredImage!,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller.textEditingController,
              // maxLines: null - 키보드 타입에서 완료 버튼이 줄바꿈으로 바뀐다.
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 15),
                hintText: '문구 입력...',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget infoOnt(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      child: Text(
        title,
        style: const TextStyle(fontSize: 17),
      ),
    );
  }

  // 디바이더 지정
  Widget get line => const Divider(color: Colors.grey);

  Widget snsInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Facebook',
                style: TextStyle(fontSize: 17),
              ),
              Switch(
                value: false,
                onChanged: (bool value) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Twitter',
                style: TextStyle(fontSize: 17),
              ),
              Switch(
                value: false,
                onChanged: (bool value) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tumblr',
                style: TextStyle(fontSize: 17),
              ),
              Switch(
                value: false,
                onChanged: (bool value) {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: Get.back,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ImageData(
              IconsPath.backBtnIcon,
              width: 50,
            ),
          ),
        ),
        title: const Text(
          '새 게시물',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: controller.uploadPost,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ImageData(IconsPath.uploadComplete),
            ),
          )
        ],
      ),
      // FocusManager.instance.primaryFocus?.unfocus() - 화면 클릭 시 키보드 자판 사라짐
      // on Tap 부분을 전체화면으로 구성하는 방법
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: GestureDetector(
              onTap: controller.unfocusKeyboard,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _description(),
                line,
                infoOnt('사람 태그하기'),
                line,
                infoOnt('위치 추가'),
                line,
                infoOnt('다른 미디어에도 게시'),
                snsInfo(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
