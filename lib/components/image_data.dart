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
  static String get logo => 'images/logo.jpg';
  static String get directMessage => 'images/direct_msg_icon.jpg';
  static String get plusIcon => 'images/plus_icon.png';
  static String get postMoreIcon => 'images/more_icon.jpg';
  static String get likeOffIcon => 'images/like_off_icon.jpg';
  static String get likeOnIcon => 'images/like_on_icon.jpg';
  static String get replyIcon => 'images/reply_icon.jpg';
  static String get bookMarkOffIcon => 'images/book_mark_off_icon.jpg';
  static String get bookMarkOnIcon => 'images/book_mark_on_icon.jpg';
  static String get backBtnIcon => 'images/back_icon.jpg';
  static String get menuIcon => 'images/menu_icon.jpg';
  static String get addFriend => 'images/add_friend_icon.jpg';
  static String get gridViewOff => 'images/grid_view_off_icon.jpg';
  static String get gridViewOn => 'images/grid_view_on_icon.jpg';
  static String get myTagImageOff => 'images/my_tag_image_off_icon.jpg';
  static String get myTagImageOn => 'images/my_tag_image_on_icon.jpg';
  static String get nextImage => 'images/upload_next_icon.jpg';
  static String get closeImage => 'images/close_icon.jpg';
  static String get imageSelectIcon => 'images/image_select_icon.jpg';
  static String get cameraIcon => 'images/camera_icon.jpg';
  static String get uploadComplete => 'images/upload_complete_icon.jpg';
  static String get mypageBottomSheet01 => 'images/mypage_bottom_sheet_01.jpg';
  static String get mypageBottomSheet02 => 'images/mypage_bottom_sheet_02.jpg';
  static String get mypageBottomSheet03 => 'images/mypage_bottom_sheet_03.jpg';
  static String get mypageBottomSheet04 => 'images/mypage_bottom_sheet_04.jpg';
  static String get mypageBottomSheet05 => 'images/mypage_bottom_sheet_05.jpg';
  static String get mypageBottomSheetSetting01 =>
      'images/mypage_bottom_sheet_setting_01.jpg';
  static String get mypageBottomSheetSetting02 =>
      'images/mypage_bottom_sheet_setting_02.jpg';
  static String get mypageBottomSheetSetting03 =>
      'images/mypage_bottom_sheet_setting_03.jpg';
  static String get mypageBottomSheetSetting04 =>
      'images/mypage_bottom_sheet_setting_04.jpg';
  static String get mypageBottomSheetSetting05 =>
      'images/mypage_bottom_sheet_setting_05.jpg';
  static String get mypageBottomSheetSetting06 =>
      'images/mypage_bottom_sheet_setting_06.jpg';
  static String get mypageBottomSheetSetting07 =>
      'images/mypage_bottom_sheet_setting_07.jpg';
  static String get glogo => 'images/glogo.png';
  static String get flogo => 'images/flogo.png';
}
