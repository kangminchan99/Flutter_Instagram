import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ImageData extends StatelessWidget {
  String icon;
  final double width;

  // 필수 파라미터로 icon 가져오기
  // this.width = 55 - 디폴트값 설정
  ImageData(this.icon, {super.key, this.width = 55});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      // 디바이스 별로 픽셀 설정
      width: width / Get.mediaQuery.devicePixelRatio,
    );
  }
}

class IconsPath {
  static String get homeOff => 'images/bottom_nav_home_off_icon.jpg';
  static String get homeOn => 'images/bottom_nav_home_on_icon.jpg';
  static String get searchOff => 'images/bottom_nav_search_off_icon.jpg';
  static String get searchOn => 'images/bottom_nav_search_on_icon.jpg';
  static String get uploadIcon => 'images/bottom_nav_upload_icon.jpg';
  static String get activeOff => 'images/bottom_nav_active_off_icon.jpg';
  static String get activeOn => 'images/bottom_nav_active_on_icon.jpg';
}
