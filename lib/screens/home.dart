import 'package:flutter/material.dart';
import '../constrains/color.dart';
import 'todo_table.dart';
import '../model/todo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = ToDo.todoList();
  List<ToDo> _searchTodo = [];
  final _todoController = TextEditingController();
  @override
  void initState() {
    _searchTodo = todoList;
    // TODO: implement initState
    super.initState();
  }

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
      body: Stack(
        children: [
          Container(
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
                      for (ToDo todo in _searchTodo.reversed)
                        TodoTable(
                          todo: todo,
                          onTodoChange: _handelToDoChange,
                          onDeleteItem: _onDeleteItem,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: const InputDecoration(
                          hintText: 'Add new todo', border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _addTodoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlue,
                      minimumSize: const Size(80, 40),
                      elevation: (10),
                    ),
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handelToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _onDeleteItem(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void _addTodoItem(String todo) {
    setState(() {
      todoList.add(
        ToDo(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            todoText: todo),
      );
    });
    _todoController.clear();
  }

  void _runFilter(String enterKeyword) {
    List<ToDo> result = [];
    if (enterKeyword.isEmpty) {
      result = todoList;
    } else {
      result = todoList
          .where((item) =>
              item.todoText!.toLowerCase().contains(enterKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _searchTodo = result;
    });
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
            child: TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: tdBlack,
                  size: 20,
                ),
                prefixIconColor: Color.fromARGB(255, 246, 243, 243),
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
}
