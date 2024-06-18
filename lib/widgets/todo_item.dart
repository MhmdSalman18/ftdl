import 'package:flutter/material.dart';
import 'package:to_do_list/model/todo.dart';

class ToDoItem extends StatefulWidget {
  final Todo todo;
  final onToDoChanged;
  final onDeleteItem;
  const ToDoItem({Key? key, required this.todo, this.onToDoChanged, this.onDeleteItem}) : super(key: key);

  @override
  _ToDoItemState createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: () {
          widget.onToDoChanged(widget.todo);
          //print("Tapped")
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        tileColor: Colors.white,
         leading: Icon(
          widget.todo.isDone ?? false ? Icons.check_box : Icons.check_box_outline_blank,
          color: const Color.fromARGB(255, 0, 68, 255),
        ),
        title: Text(
          widget.todo.todoText ?? '',
          style: TextStyle(
            decoration: (widget.todo.isDone ?? false)
                ? TextDecoration.lineThrough
                : null,
          ),
        ),
        trailing: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // print("Delete");
              widget.onDeleteItem(widget.todo.id);
            },
          ),
        ),
      ),
    );
  }
}
