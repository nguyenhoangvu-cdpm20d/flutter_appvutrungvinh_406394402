import 'package:flutter/material.dart';

class searchSreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm ',
                  //prefixIcon: Icon(Icons.search),
                  //  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.clear,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
