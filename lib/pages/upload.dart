import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_insta/components/image_data.dart';
import 'package:flutter_insta/controller/upload_controller.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class Upload extends GetView<UploadController> {
  Upload({super.key});

  // @override
  // void initState() {
  //   super.initState();

  // }

  // setState를 update 함수로 사용
  // void update() => setState(() {});

  Widget _imagePreview() {
    var size = Get.width;
    return Obx(
      () => Container(
        width: size,
        height: size,
        color: Colors.grey,
        child: _photoWidget(
          controller.selectedImage.value,
          size.toInt(),
          builder: (data) {
            return Image.memory(
              data,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              // 바텀 시트 띄우기
              showModalBottomSheet(
                context: Get.context!,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                // 바텀 시트 크기 늘리기
                isScrollControlled:
                    controller.albums.length > 10 ? true : false,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(Get.context!).size.height -
                      MediaQuery.of(Get.context!).padding.top,
                ),

                //
                builder: (_) => Container(
                  height: controller.albums.length > 10
                      ? Size.infinite.height
                      : controller.albums.length * 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black54),
                          width: 40,
                          height: 4,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // ... - 열거하기 위해 사용.
                              ...List.generate(
                                controller.albums.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    controller
                                        .changeAlbum(controller.albums[index]);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 20),
                                    child: Text(controller.albums[index].name),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Text(
                    controller.headerTitle.value,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    color: const Color(0xff808080),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    ImageData(IconsPath.imageSelectIcon),
                    const SizedBox(width: 7),
                    const Text(
                      '여러 항목 선택',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff808080),
                ),
                child: ImageData(IconsPath.cameraIcon),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _imageSelectList() {
    // crossAxisCount - 몇 단계로 나눌 것인가?
    return Obx(
      () => GridView.builder(
        // NeverScrollableScrollPhysics - 그리드 뷰의 스크롤을 사용하지 않는다.
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            // crossAxisSpacing: 1 , mainAxisSpacing: 1 - 간격을 1씩 띄워 준다.
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            childAspectRatio: 1),
        itemCount: controller.imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return _photoWidget(controller.imageList[index], 200,
              builder: (data) {
            return GestureDetector(
              onTap: () {
                controller.changeSelectedImage(controller.imageList[index]);
              },
              child: Obx(
                () => Opacity(
                  opacity: controller.imageList[index] ==
                          controller.selectedImage.value
                      ? 0.3
                      : 1,
                  child: Image.memory(
                    data,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }

  // 아래에 이미지를 넣는 부분.
  Widget _photoWidget(AssetEntity asset, int thumsize,
      {required Widget Function(Uint8List) builder}) {
    return FutureBuilder(
        future: asset.thumbnailDataWithSize(ThumbnailSize(thumsize, thumsize)),
        // future: asset.thumbnailData,
        builder: (_, AsyncSnapshot<Uint8List?> snapshot) {
          if (snapshot.hasData) {
            return builder(snapshot.data!);
          } else {
            return Container();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: Get.back,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ImageData(IconsPath.closeImage),
          ),
        ),
        title: const Text(
          'New Post',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ImageData(
                IconsPath.nextImage,
                width: 50,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _imagePreview(),
            _header(),
            _imageSelectList(),
          ],
        ),
      ),
    );
  }
}
