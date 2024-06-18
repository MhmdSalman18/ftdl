class Todo{
  String? id;
  String? todoText;
  bool? isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone=false
  });
  static List<Todo> todoList() {
    return[
  
    Todo(
      id: '1',
      todoText: 'Learn Flutter',
      isDone: true
    ),
    Todo(
      id: '2',
      todoText: 'Learn Dart',
      isDone: true
    ),
    Todo(
      id: '3',
      todoText: 'Learn State Management',
      isDone: true
    ),
     Todo(
      id: '4',
      todoText: 'Learn Flutter',
      isDone: false
    ),
    Todo(
      id: '5',
      todoText: 'Learn Dart',
      isDone: false
    ),
    Todo(
      id: '6',
      todoText: 'Learn State Management',
      isDone: false
    ),
    ];
  
  }
}
