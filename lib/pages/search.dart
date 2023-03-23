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

  Widget _body() {
    return SingleChildScrollView(
      child: Row(
        children: [
          Column(
            children: [],
          ),
          Column(
            children: [],
          ),
          Column(
            children: [],
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
