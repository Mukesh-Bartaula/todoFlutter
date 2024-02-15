import 'package:flutter/material.dart';
import '../constrains/color.dart';
import './todoTable.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGCOlor,
      appBar: AppBar(
        backgroundColor: tdBGCOlor,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: tdBlack,
              size: 30,
            ),
            Text('Todo'),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          children: [
            searchBox(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                    ),
                    child: const Text(
                      'All Todos',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TodoTable(),
                  TodoTable(),
                  TodoTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget searchBox() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(
                Icons.search,
                color: tdBlack,
                size: 20,
              ),
              prefixIconConstraints: BoxConstraints(
                maxHeight: 20,
              ),
              hintText: 'Search',
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    ),
  );
}
