import 'package:flutter/material.dart';
import 'package:flutter_insta/components/image_data.dart';
import 'package:get/get.dart';

class SearchFocus extends StatefulWidget {
  const SearchFocus({super.key});

  @override
  State<SearchFocus> createState() => _SearchFocusState();
}

class _SearchFocusState extends State<SearchFocus>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    // this를 사용하려면 with TickerProviderStateMixin을 넣어줘야한다.
    tabController = TabController(length: 5, vsync: this);
  }

  Widget _tabMenuOne(String menu) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        menu,
        style: const TextStyle(fontSize: 14, color: Colors.black),
      ),
    );
  }

  PreferredSizeWidget tabMenu() {
    return PreferredSize(
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      child: Container(
        height: 50,
        // Size.infinite.width - 전체 사이즈 차지
        width: Size.infinite.width,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xffe4e4e4)))),
        child: TabBar(
            controller: tabController,
            indicatorColor: Colors.black,
            tabs: [
              _tabMenuOne('인기'),
              _tabMenuOne('계정'),
              _tabMenuOne('오디오'),
              _tabMenuOne('태그'),
              _tabMenuOne('장소'),
            ]),
      ),
    );
  }

  Widget _body() {
    return TabBarView(
      controller: tabController,
      children: const [
        Center(child: Text('인기 페이지')),
        Center(child: Text('계정 페이지')),
        Center(child: Text('오디오 페이지')),
        Center(child: Text('태그 페이지')),
        Center(child: Text('장소 페이지')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
            onTap: Get.back,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ImageData(IconsPath.backBtnIcon),
            )),

        // 두개의 간격을 붙여준다.
        titleSpacing: 0,
        title: Container(
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xffefefef)),
          child: const TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                contentPadding: EdgeInsets.only(left: 15, top: 7, bottom: 7),
                // true로 두면 간격이 줄어든다
                isDense: true),
          ),
        ),
        bottom: tabMenu(),
      ),
      body: _body(),
    );
  }
}
