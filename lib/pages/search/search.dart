import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta/pages/search/search_focus.dart';
import 'package:get/get.dart';
import 'package:quiver/iterables.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // 이중 어레이 사용
  List<List<int>> groupBox = [[], [], []];
  // groupIndex - 사이즈를 매칭되는 위치에 더해준다. (작은 사이즈에 먼저 넣어준다.)
  List<int> groupIndex = [0, 0, 0];
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 101; i++) {
      // 몇번째 인덱스가 가장 작은지 추출해서 그것에다 더해준다.
      var gi = groupIndex.indexOf(min<int>(groupIndex)!);

      var size = 1;
      if (gi != 1) {
        // 나머지가 0이면 1 아니면 2
        size = Random().nextInt(100) % 2 == 0 ? 1 : 2;
      }
      groupBox[gi].add(size);
      // 더해줌
      groupIndex[gi] += size;
    }
  }

  Widget _appbar() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              // Get.to(const SearchFocus());
              // 중첩라우터 설정
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SearchFocus()));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              margin: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color(0xffefefef),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search),
                  Text(
                    'search',
                    style: TextStyle(fontSize: 15, color: Color(0xff838383)),
                  )
                ],
              ),
            ),
          ),
        ),
        const Padding(
            padding: EdgeInsets.all(15), child: Icon(Icons.location_pin)),
      ],
    );
  }

  // 로우로 구성된 3개의 컬럼으로 컨테이너에 이미지가 하나씩 들어간다. 비디오는 세로로 2칸을 차지 (가운데는 들어오지 않음)
  Widget _body() {
    return SingleChildScrollView(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // List.generate_groupBox.length 길이(3) 만큼 돈다.
          children: List.generate(
            groupBox.length,
            (index) => Expanded(
              child: Column(
                // 요소마다 1이 나오므로 높이가 0.33인 정사각형이 쌓인다.
                children: List.generate(
                  groupBox[index].length,
                  (idx) => Container(
                    height: Get.width * 0.33 * groupBox[index][idx],
                    // 경계면 표시
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        // 색깔 랜덤지정
                        color: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)]),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://img.hankyung.com/photo/202112/BF.28304936.1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ).toList(),
              ),
            ),
          ).toList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea - 상단 영역에 상태 표시줄을 벗어나지 않고,
      // ios같은 경우 밑에서 올리는 스크롤을 안전하게 지켜준다.
      body: SafeArea(
        child: Column(
          children: [_appbar(), Expanded(child: _body())],
        ),
      ),
    );
  }
}
