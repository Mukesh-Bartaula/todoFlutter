import 'package:flutter/material.dart';
import 'package:newtodo/constrains/color.dart';

class TodoTable extends StatelessWidget {
  const TodoTable({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: const Icon(
          Icons.check_box,
          color: tdBlue,
        ),
        title: const Text(
          'Todos Title',
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: TextDecoration.lineThrough,
          ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            color: tdBGCOlor,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
