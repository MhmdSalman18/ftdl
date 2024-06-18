import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_list/model/todo.dart';
import 'package:to_do_list/widgets/todo_item.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = Todo.todoList(); //todoList function from Todo class
  final _toodController = TextEditingController();
  List<Todo> _foundTodos = [];
  @override
  void initState() {
    _foundTodos=todosList;
    super.initState();
  }

  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.isDone = (todo.isDone ?? false) ? false : true;
    });
  }

  void _handleDeleteItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }
  void _handleAddItem(String toDo) {
    setState(() {
      todosList.add(Todo(
        id: DateTime.now().toString(),
        todoText: toDo,
      ));
      _toodController.clear();
    });
  }
  void _handleSearch(String enteredtext) {
    List<Todo> result = [];
    if (enteredtext.isEmpty) {
      result = todosList;
    } else {
     result = todosList.where((element) => element.todoText!.toLowerCase().contains(enteredtext.toLowerCase())).toList();
    }
    setState(() {
      _foundTodos = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Background color of the page
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text("heello"),
                      ),
                      for (Todo i in _foundTodos.reversed)
                        ToDoItem(
                          todo: i,
                          onToDoChanged: _handleTodoChange,
                          onDeleteItem: _handleDeleteItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the row
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 5.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 300, // Ensure the container has a fixed width
                    child: TextField(
                      controller: _toodController,
                      decoration: InputDecoration(
                        hintText: 'Enter items to be included in the list',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _handleAddItem(_toodController.text);
                    },
                    child: Text('+'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black, // Text color of the button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        // Ensure the button has a fixed width
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (text) {
          _handleSearch(text);
        },
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[100], // Background color of the appbar
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Icon(
          Icons.menu,
          color: Colors.black,
          size: 30,
        ),
        Container(
          width: 40,
          height: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset('assets/images/dp.jpg'),
          ),
        )
      ]), // Title of the page,
    );
  }
}
