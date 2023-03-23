import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  Widget _appbar() {
    return Row(
      children: [
        Expanded(
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
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 140,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 140,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 140,
                  color: Colors.green,
                ),
              ],
            ),
          )
        ],
      ),
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
